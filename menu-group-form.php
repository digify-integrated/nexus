<?php
    require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Menu Groups';

    $check_user_status = $api->check_user_status($email);

    if($check_user_status){
        $page_details = $api->get_page_details(16);
        $module_id = $page_details[0]['MODULE_ID'];
        $page_title = $page_details[0]['PAGE_NAME'];
    
        $menu_read_access_right = $api->check_menu_access_rights($email, 16, 'read');
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
                  <li class="breadcrumb-item"><a href="javascript: void(0)">User Interface</a></li>
                  <li class="breadcrumb-item"><a href="menu-groups.php">Menu Groups</a></li>
                  <li class="breadcrumb-item" aria-current="page">Menu Group Form</li>
                  <li class="breadcrumb-item">1</li>
                </ul>
              </div>
              <div class="col-md-12">
                <div class="page-header-title">
                  <h2 class="mb-0">Menu Group Form</h2>
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
                      <h5>Menu Groups Form</h5>
                    </div>
                    <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">
                    <div class="btn-group">
                      <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        Action
                      </button>
                      <ul class="dropdown-menu dropdown-menu-end">
                        <li><button class="dropdown-item" type="button">Action</button></li>
                        <li><button class="dropdown-item" type="button">Another action</button></li>
                        <li><button class="dropdown-item" type="button">Something else here</button></li>
                      </ul>
                    </div>
                      <a href="menu-group-form.php" class="btn btn-success">Create</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <table id="menu-groups-table" class="table table-striped table-hover table-bordered nowrap">
                  <thead>
                    <tr>
                      <th class="all">
                        <div class="form-check">
                          <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                        </div>
                      </th>
                      <th>#</th>
                      <th>Menu Group</th>
                      <th>Order Sequence</th>
                      <th>View</th>
                    </tr>
                  </thead>
                  <tbody></tbody>
                </table>
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
    <script src="./assets/js/plugins/jquery.dataTables.min.js"></script>
    <script src="./assets/js/plugins/dataTables.bootstrap5.min.js"></script>
    <script src="./assets/js/pages/menu-groups.js?v=<?php echo rand(); ?>"></script>
</body>

</html>