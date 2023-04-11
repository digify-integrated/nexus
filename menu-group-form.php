<?php
require('session.php');
require('config/config.php');
require('classes/api.php');

$api = new Api;
$page_title = 'Menu Groups Form';

$check_user_status = $api->check_user_status(null, $email);

if($check_user_status){    
  $menu_group_read_access_right = $api->check_menu_access_rights($email, 1, 'read');
      
  if($menu_group_read_access_right > 0){

    if(isset($_GET['id']) && !empty($_GET['id'])){
      $id = $_GET['id'];
      $menu_group_id = $api->decrypt_data($id);

      $menu_group_create_access_right = $api->check_menu_access_rights($email, 1, 'create');
      $menu_group_write_access_right = $api->check_menu_access_rights($email, 1, 'write');
      $menu_group_delete_access_right = $api->check_menu_access_rights($email, 1, 'delete');
    }
    else{
      $menu_group_id = null;
    }
        
    require('views/_interface_settings.php');
    require('views/_user_account_details.php');
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
                  <li class="breadcrumb-item">User Interface</li>
                  <li class="breadcrumb-item"><a href="menu-groups.php">Menu Groups</a></li>
                  <li class="breadcrumb-item" aria-current="page">Menu Group Form</li>
                  <?php
                    if(!empty($menu_group_id)){
                      echo '<li class="breadcrumb-item" id="menu-group-id">'. $menu_group_id .'</li>';
                    }
                  ?>
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
                      <?php
                        if(!empty($menu_group_id)){
                          $dropdown = '<div class="btn-group m-r-10">
                          <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            Action
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end">';

                          if($menu_group_create_access_right > 0){
                            $dropdown .= '<li><button class="dropdown-item" type="button">Create Menu Group</button></li>';
                          }

                          if($menu_group_delete_access_right > 0){
                            $dropdown .= '<li><button class="dropdown-item" type="button" data-menu-group-id="'. $menu_group_id .'" id="delete-menu-group">Delete Menu Group</button></li>';
                          }

                          $dropdown .= '</ul>
                                </div>';
                          
                          echo $dropdown;
                        }

                        if(empty($menu_group_id) && $menu_group_create_access_right > 0){
                          echo '<button type="submit" for="menu-group-form" class="btn btn-success form-edit" id="submit-data">Save</button>
                          <button type="button" id="discard-create" class="btn btn-outline-danger form-edit">Discard</button>';
                        }
                        else if(!empty($menu_group_id) && $menu_group_write_access_right > 0){
                          echo '<button type="submit" for="menu-group-form" class="btn btn-info form-details" id="edit-form">Edit</button>
                          <button type="submit" for="menu-group-form" class="btn btn-success form-edit d-none" id="submit-data">Save</button>
                          <button type="button" id="discard-create" class="btn btn-outline-danger form-edit d-none">Discard</button>';
                        }
                        else if(!empty($menu_group_id) && $menu_group_write_access_right == 0){
                            echo '<button type="button" id="view-transaction-log" class="btn btn-info waves-effect waves-light form-details" data-bs-toggle="offcanvas" data-bs-target="#transaction-log-filter-off-canvas" aria-controls="transaction-log-filter-off-canvas">
                                    <span class="d-block d-sm-none"><i class="bx bx-notepad"></i></span>
                                    <span class="d-none d-sm-block">Transaction Log</span>
                                </button>';
                        }
                      ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <form id="menu-group-form" method="post" action="#">
                      <input type="hidden" id="menu_group_id" name="menu_group_id" value="<?php echo $menu_group_id; ?>">
                      <div class="row">
                        <div class="form-group col-md-6">
                          <label class="form-label" for="menu_group">Menu Group <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="menu_group">
                        </div>
                        <div class="form-group col-md-6">
                          <label class="form-label" for="order_sequence">Order Sequence <span class="text-danger">*</span></label>
                          <input type="number" class="form-control" id="order_sequence" min="1">
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php
            if(!empty($menu_group_id)){
              $log_note = '<div class="row">
                              <div class="col-lg-12">
                                <div class="card">
                                  <div id="sticky-action" class="sticky-action">
                                    <div class="card-header">
                                      <div class="row align-items-center">
                                        <div class="col-sm-6">
                                          <h5>Log Notes</h5>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="log-notes-scroll" style="height: 415px; position: relative;">
                                    <div class="card-body p-b-0">';
                $log_note .= $api->generate_log_notes('menu_groups', $menu_group_id);
                $log_note .= '</div>
                          </div>
                        </div>';
              echo $log_note;
            }
        ?>
      </div>
    </section>

    <?php 
        include_once('views/_footer.php'); 
        include_once('views/_required_js.php'); 
        include_once('views/_customizer.php'); 
    ?>
    <script src="./assets/js/plugins/jquery.dataTables.min.js"></script>
    <script src="./assets/js/plugins/dataTables.bootstrap5.min.js"></script>
    <script src="./assets/js/pages/menu-group-form.js?v=<?php echo rand(); ?>"></script>
</body>

</html>