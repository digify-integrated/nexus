<?php
require('session.php');
require('config/config.php');
require('classes/api.php');

$api = new Api;
$page_title = 'Upload Setting Form';

$check_user_status = $api->check_user_status(null, $email);

if($check_user_status){    
  $upload_setting_read_access_right = $api->check_menu_access_rights($email, 2, 'read');
      
  if($upload_setting_read_access_right > 0){
    if(isset($_GET['id']) && !empty($_GET['id'])){
      $id = $_GET['id'];
      $upload_setting_id = $api->decrypt_data($id);

      $check_upload_settings_exist = $api->check_upload_settings_exist($upload_setting_id);
        
      if($check_upload_settings_exist === 0){
        header('location: 404.php');
      }
    }
    else{
      $upload_setting_id = null;
    }

    $upload_setting_create_access_right = $api->check_menu_access_rights($email, 5, 'create');
    $upload_setting_write_access_right = $api->check_menu_access_rights($email, 5, 'write');
    $upload_setting_delete_access_right = $api->check_menu_access_rights($email, 5, 'delete');
        
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
                  <li class="breadcrumb-item">Configurations</li>
                  <li class="breadcrumb-item"><a href="upload-settings.php">Upload Settings</a></li>
                  <li class="breadcrumb-item" aria-current="page">Upload Setting Form</li>
                  <?php
                    if(!empty($upload_setting_id)){
                      echo '<li class="breadcrumb-item" id="upload-setting-id">'. $upload_setting_id .'</li>';
                    }
                  ?>
                </ul>
              </div>
              <div class="col-md-12">
                <div class="page-header-title">
                  <h2 class="mb-0">Upload Setting Form</h2>
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
                    <div class="col-md-6">
                      <h5>Upload Settings Form</h5>
                    </div>
                    <div class="col-md-6 text-sm-end mt-3 mt-sm-0">
                      <?php
                        if (!empty($upload_setting_id)) {
                            $dropdown = '<div class="btn-group m-r-5 ">
                                              <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                Action
                                              </button>
                                              <ul class="dropdown-menu dropdown-menu-end">';
                                              
                          if ($upload_setting_create_access_right > 0) {
                            $dropdown .= '<li><a class="dropdown-item" href="upload-setting-form.php">Create Upload Setting</a></li>
                            <li><button class="dropdown-item" type="button" data-upload-setting-id="' . $upload_setting_id . '" id="duplicate-upload-setting">Duplicate Upload Setting</button></li>';
                          }

                          if ($upload_setting_delete_access_right > 0) {
                            $dropdown .= '<li><button class="dropdown-item" type="button" data-upload-setting-id="' . $upload_setting_id . '" id="delete-upload-setting">Delete Upload Setting</button></li>';
                          }

                          $dropdown .= '</ul>
                                        </div>';

                          echo $dropdown;
                        }
                            
                        if (empty($upload_setting_id) && $upload_setting_create_access_right > 0) {
                          echo '<button type="submit" form="upload-setting-form" class="btn btn-success form-edit" id="submit-data">Save</button>
                                <button type="button" id="discard-create" class="btn btn-outline-danger form-edit">Discard</button>';
                        } 
                        else if (!empty($upload_setting_id) && $upload_setting_write_access_right > 0) {
                          echo '<button type="submit" class="btn btn-info form-details" id="edit-form">Edit</button>
                                <button type="submit" form="upload-setting-form" class="btn btn-success form-edit d-none" id="submit-data">Save</button>
                                <button type="button" id="discard-update" class="btn btn-outline-danger form-edit d-none">Discard</button>';
                        }
                      ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <?php echo $api->generate_form('upload settings form', $upload_setting_id, $email); ?>
              </div>
            </div>
          </div>

            <?php
                if(!empty($upload_setting_id)){
                    echo '<div class="col-lg-12">
                            <div class="card">
                            <div id="sticky-action" class="sticky-action">
                                <div class="card-header">
                                <div class="row align-items-center">
                                    <div class="col-sm-6">
                                    <h5>Menu Item</h5>
                                    </div>
                                    <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">
                                        <button type="button" class="btn btn-success" id="create-upload-setting-file-extension">Create</button>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="dt-responsive table-responsive">
                                <table id="upload-setting-file-extension-table" class="table table-striped table-hover table-bordered nowrap w-100 dataTable">
                                    <thead>
                                    <tr>
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
                        </div>';
                }

                if(!empty($upload_setting_id)){
                    echo $api->generate_log_notes('upload_settings', $upload_setting_id);
                }

                echo $api->generate_modal('add upload setting file extension form', 'upload-setting-file-extension-form', 'upload-setting-file-extension-modal', 'File Exetension');
            ?>
            </div>
        </div>
    </section>

    <?php 
        include_once('views/_footer.php'); 
        include_once('views/_required_js.php'); 
        include_once('views/_customizer.php'); 
    ?>
    <script src="./assets/js/plugins/bootstrap-maxlength.min.js"></script>
    <script src="./assets/js/plugins/jquery.dataTables.min.js"></script>
    <script src="./assets/js/plugins/dataTables.bootstrap5.min.js"></script>
    <script src="./assets/js/plugins/sweetalert2.all.min.js"></script>
    <script src="./assets/js/plugins/select2.min.js?v=<?php echo rand(); ?>"></script>
    <script src="./assets/js/pages/upload-setting-form.js?v=<?php echo rand(); ?>"></script>
</body>

</html>