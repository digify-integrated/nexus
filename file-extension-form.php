<?php
require('session.php');
require('config/config.php');
require('classes/api.php');

$api = new Api;
$page_title = 'File Extension Form';

$check_user_status = $api->check_user_status(null, $email);

if($check_user_status){    
  $file_extension_read_access_right = $api->check_menu_access_rights($email, 7, 'read');
      
  if($file_extension_read_access_right > 0){
    if(isset($_GET['id']) && !empty($_GET['id'])){
      $id = $_GET['id'];
      $file_extension_id = $api->decrypt_data($id);

      $check_file_extension_exist = $api->check_file_extension_exist($file_extension_id);
        
      if($check_file_extension_exist === 0){
        header('location: 404.php');
      }
    }
    else{
      $file_extension_id = null;
    }

    $file_extension_create_access_right = $api->check_menu_access_rights($email, 7, 'create');
    $file_extension_write_access_right = $api->check_menu_access_rights($email, 7, 'write');
    $file_extension_delete_access_right = $api->check_menu_access_rights($email, 7, 'delete');
        
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
                  <li class="breadcrumb-item"><a href="file-extensions.php">File Extensions</a></li>
                  <li class="breadcrumb-item" aria-current="page">File Extesion Form</li>
                  <?php
                    if(!empty($file_extension_id)){
                      echo '<li class="breadcrumb-item" id="file-extension-id">'. $file_extension_id .'</li>';
                    }
                  ?>
                </ul>
              </div>
              <div class="col-md-12">
                <div class="page-header-title">
                  <h2 class="mb-0">File Extension Form</h2>
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
                      <h5>File Extension Form</h5>
                    </div>
                    <div class="col-md-6 text-sm-end mt-3 mt-sm-0">
                      <?php
                        if (!empty($file_extension_id)) {
                            $dropdown = '<div class="btn-group m-r-5 ">
                                              <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                                Action
                                              </button>
                                              <ul class="dropdown-menu dropdown-menu-end">';
                                              
                          if ($file_extension_create_access_right > 0) {
                            $dropdown .= '<li><a class="dropdown-item" href="file-extension-form.php">Create File Extension</a></li>
                            <li><button class="dropdown-item" type="button" data-file-extension-id="' . $file_extension_id . '" id="duplicate-file-extension">Duplicate File Extension</button></li>';
                          }

                          if ($file_extension_delete_access_right > 0) {
                            $dropdown .= '<li><button class="dropdown-item" type="button" data-file-extension-id="' . $file_extension_id . '" id="delete-file-extension">Delete File Extension</button></li>';
                          }

                          $dropdown .= '</ul>
                                        </div>';

                          echo $dropdown;
                        }
                            
                        if (empty($file_extension_id) && $file_extension_create_access_right > 0) {
                          echo '<button type="submit" form="file-extension-form" class="btn btn-success form-edit" id="submit-data">Save</button>
                                <button type="button" id="discard-create" class="btn btn-outline-danger form-edit">Discard</button>';
                        } 
                        else if (!empty($file_extension_id) && $file_extension_write_access_right > 0) {
                          echo '<button type="submit" class="btn btn-info form-details" id="edit-form">Edit</button>
                                <button type="submit" form="file-extension-form" class="btn btn-success form-edit d-none" id="submit-data">Save</button>
                                <button type="button" id="discard-update" class="btn btn-outline-danger form-edit d-none">Discard</button>';
                        }
                      ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <?php echo $api->generate_form('file extension form', $file_extension_id, $email); ?>
              </div>
            </div>
          </div>
            <?php
                if(!empty($file_extension_id)){
                    echo $api->generate_log_notes('file_extension', $file_extension_id);
                }
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
    <script src="./assets/js/pages/file-extension-form.js?v=<?php echo rand(); ?>"></script>
</body>

</html>