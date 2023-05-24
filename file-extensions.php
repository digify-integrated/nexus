<?php
require('session.php');
require('config/config.php');
require('classes/api.php');

$api = new Api;
$page_title = 'File Extensions';

$check_user_status = $api->check_user_status(null, $email);
    
if($check_user_status){    
  $menu_read_access_right = $api->check_menu_access_rights($email, 7, 'read');
          
  if($menu_read_access_right > 0){            
    require('views/_interface_settings.php');
    require('views/_user_account_details.php');

    $file_extension_create_access_right = $api->check_menu_access_rights($email, 7, 'create');
    $file_extension_delete_access_right = $api->check_menu_access_rights($email, 7, 'delete');
  }
  else{
    header('location: 404.php');
  }
}
else{
  header('location: logout.php?logout');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include_once('views/_title.php'); ?>
    <link rel="stylesheet" href="./assets/css/plugins/select2.min.css">
    <?php include_once('views/_required_css.php'); ?>
    <link rel="stylesheet" href="./assets/css/plugins/dataTables.bootstrap5.min.css">
</head>

<body>
    <?php 
        include_once('views/_preloader.html'); 
        include_once('views/_navbar.php'); 
        include_once('views/_header.php'); 
        include_once('views/_announcement.php'); 
    ?>
    
    <section class="pc-container">
      <div class="pc-content">
        <div class="page-header">
          <div class="page-block">
            <div class="row align-items-center">
              <div class="col-md-12">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                  <li class="breadcrumb-item"><a href="javascript: void(0)">Configurations</a></li>
                  <li class="breadcrumb-item" aria-current="page">File Extensions</li>
                </ul>
              </div>
              <div class="col-md-12">
                <div class="page-header-title">
                  <h2 class="mb-0">File Extensions</h2>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div id="sticky-action" class="sticky-action">
                <div class="card-header">
                  <div class="row align-items-center">
                    <div class="col-sm-6">
                      <h5>File Extensions List</h5>
                    </div>
                    <?php
                      if($file_extension_create_access_right > 0 || $file_extension_delete_access_right > 0){
                        $action = ' <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">';
                        
                          if($file_extension_delete_access_right > 0){
                            $action .= '<div class="btn-group m-r-5 d-none action-dropdown">
                                          <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Action</button>
                                          <ul class="dropdown-menu dropdown-menu-end">
                                            <li><button class="dropdown-item" type="button" id="delete-file-extension">Delete File Extension</button></li>
                                          </ul>
                                          </div>';
                          }

                          if($file_extension_create_access_right > 0){
                            $action .= '<a href="file-extension-form.php" class="btn btn-success m-r-5">Create</a>';
                          }

                        $action .= '<button class="btn btn-warning" type="button" data-bs-toggle="offcanvas" data-bs-target="#filter-canvas" aria-controls="offcanvasRight">Filter</button></div>';
                          
                        echo $action;
                      }
                    ?>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive dt-responsive">
                  <table id="file-extensions-table" class="table table-striped table-hover table-bordered nowrap w-100">
                    <thead>
                      <tr>
                        <th class="all">
                          <div class="form-check">
                            <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                          </div>
                        </th>
                        <th>#</th>
                        <th>File Extension</th>
                        <th>File Type</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody></tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="offcanvas offcanvas-end" tabindex="-1" id="filter-canvas" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
              <h5 id="offcanvasRightLabel">Filter File Type</h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
              <div class="form-group">
                <label class="form-label" for="filter_file_type_id">File Type</label>
                <select class="form-control filter-select2" name="filter_file_type_id" id="filter_file_type_id">
                  <option value="">--</option>
                  <?php echo $api->generate_file_type_options(); ?>
                </select>
              </div>
              <div class="text-end mt-4">
                <button class="btn btn-light-primary btn-sm" id="apply-filter" data-bs-dismiss="offcanvas"> Apply </button>
                <button class="btn btn-light-danger btn-sm" data-bs-dismiss="offcanvas"> Close </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <?php 
        include_once('views/_footer.php'); 
        include_once('views/_required_js.php'); 
        include_once('views/_customizer.php'); 
    ?>
    <script src="./assets/js/plugins/sweetalert2.all.min.js"></script>
    <script src="./assets/js/plugins/select2.min.js?v=<?php echo rand(); ?>"></script>
    <script src="./assets/js/plugins/jquery.dataTables.min.js"></script>
    <script src="./assets/js/plugins/dataTables.bootstrap5.min.js"></script>
    <script src="./assets/js/pages/file-extensions.js?v=<?php echo rand(); ?>"></script>
</body>

</html>