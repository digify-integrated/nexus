<?php
require('session.php');
require('config/config.php');
require('classes/api.php');

$api = new Api;
$page_title = 'Upload Settings';

$check_user_status = $api->check_user_status(null, $email);
    
if($check_user_status){    
  $menu_read_access_right = $api->check_menu_access_rights($email, 5, 'read');
          
  if($menu_read_access_right > 0){
    require('views/_interface_settings.php');
    require('views/_user_account_details.php');

    $upload_setting_create_access_right = $api->check_menu_access_rights($email, 5, 'create');
    $upload_setting_delete_access_right = $api->check_menu_access_rights($email, 5, 'delete');
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
                  <li class="breadcrumb-item" aria-current="page">Upload Settings</li>
                </ul>
              </div>
              <div class="col-md-12">
                <div class="page-header-title">
                  <h2 class="mb-0">Upload Settings</h2>
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
                      <h5>Upload Settings List</h5>
                    </div>
                    <?php
                        if($upload_setting_create_access_right > 0 || $upload_setting_delete_access_right > 0){
                            $action = ' <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">';
                            
                            if($upload_setting_delete_access_right > 0){
                                $action .= '<div class="btn-group m-r-10">
                                            <button type="button" class="btn btn-outline-secondary dropdown-toggle d-none action-dropdown" data-bs-toggle="dropdown" aria-expanded="false">Action</button>
                                            <ul class="dropdown-menu dropdown-menu-end">
                                                <li><button class="dropdown-item" type="button" id="delete-upload-setting">Delete Upload Setting</button></li>
                                            </ul>
                                            </div>';
                            }

                            if($upload_setting_create_access_right > 0){
                                $action .= '<a href="upload-setting-form.php" class="btn btn-success">Create</a>';
                            }

                            $action .= '</div>';
                            
                            echo $action;
                        }
                    ?>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive dt-responsive">
                  <table id="upload-settings-table" class="table table-striped table-hover table-bordered nowrap w-100">
                    <thead>
                      <tr>
                        <th class="all">
                          <div class="form-check">
                            <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                          </div>
                        </th>
                        <th>#</th>
                        <th>Upload Setting</th>
                        <th>Max Upload Size</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody></tbody>
                  </table>
                </div>
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
    <script src="./assets/js/plugins/jquery.dataTables.min.js"></script>
    <script src="./assets/js/plugins/dataTables.bootstrap5.min.js"></script>
    <script src="./assets/js/pages/upload-settings.js?v=<?php echo rand(); ?>"></script>
</body>

</html>