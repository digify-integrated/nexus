<?php
require('./config/config.php');
require('./classes/api.php');

if(isset($_POST['type']) && !empty($_POST['type']) && isset($_POST['email_account']) && !empty($_POST['email_account'])){
    $api = new Api;
    $type = $_POST['type'];
    $email_account = $_POST['email_account'];
    $system_date = date('Y-m-d');
    $current_time = date('H:i:s');
    $response = array();

    switch ($type) {
        # -------------------------------------------------------------
        #   Generate elements functions
        # -------------------------------------------------------------

        case 'system modal':
            if(isset($_POST['modal_title']) && !empty($_POST['modal_title']) && isset($_POST['modal_size']) && !empty($_POST['modal_size']) && isset($_POST['is_scrollable']) && isset($_POST['has_submit_button']) && isset($_POST['form_id']) && !empty($_POST['form_id'])){
                $modal_title = $_POST['modal_title'];
                $modal_size = $api->get_modal_size($_POST['modal_size']);
                $is_scrollable = $api->check_modal_scrollable($_POST['is_scrollable']);
                $form_id = $_POST['form_id'];
                $has_submit_button = $_POST['has_submit_button'];
    
                if($has_submit_button == 1){
                    $button = '<button type="submit" class="btn btn-primary" id="submit-form" form="'. $form_id .'">Submit</button>';
                }
                else{
                    $button = '';
                }

                $modal = '<div id="System-Modal" class="modal fade modal-animate anim-fade-in-scale" tabindex="-1" role="dialog" aria-labelledby="modal-'. $form_id .'" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered '. $is_scrollable .' '. $modal_size .'" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="modal-'. $form_id .'-title">'. $modal_title .'</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modal-body"></div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      '. $button .'
                    </div>
                  </div>
                </div>
              </div>';
    
                $response[] = array(
                    'MODAL' => $modal
                );
    
                echo json_encode($response);
            }
        break;

        # -------------------------------------------------------------
        #   Generate table functions
        # -------------------------------------------------------------

        # Menu groups table
        case 'menu groups table':
            if ($api->databaseConnection()) {
                $sql = $api->db_connection->prepare('SELECT menu_group_id, menu_group_name, order_sequence FROM menu_groups');
    
                if($sql->execute()){
                    while($row = $sql->fetch()){
                        $menu_group_id = $row['menu_group_id'];
                        $menu_group_name = $row['menu_group_name'];
                        $order_sequence = $row['order_sequence'];
    
                        $menu_group_id_encrypted = $api->encrypt_data($menu_group_id);

                        $menu_group_delete_access_right = $api->check_menu_access_rights($email_account, 1, 'delete');

                        if($menu_group_delete_access_right > 0){
                            $delete = '<button type="button" class="btn btn-icon btn-danger delete-menu-group" data-menu-group-id="' . $menu_group_id . '" title="Delete Menu Group">
                                            <i class="ti ti-trash"></i>
                                        </button>';
                        }
                        else{
                            $delete = null;
                        }
    
                        $response[] = array(
                            'CHECK_BOX' => '<input class="form-check-input datatable-checkbox-children" data-delete="1" type="checkbox" value="'. $menu_group_id .'">',
                            'MENU_GROUP_ID' => $menu_group_id,
                            'MENU_GROUP_NAME' => $menu_group_name,
                            'ORDER_SEQUENCE' => $order_sequence,
                            'ACTION' => '<div class="d-flex gap-2">
                                            <a href="menu-group-form.php?id='. $menu_group_id_encrypted .'" class="btn btn-icon btn-primary" title="View Menu Group">
                                                <i class="ti ti-eye"></i>
                                            </a>
                                            '. $delete .'
                                        </div>'
                        );
                    }
    
                    echo json_encode($response);
                }
                else{
                    echo $sql->errorInfo()[2];
                }
            }
        break;

        # Menu item table
        case 'menu item table':
            if(isset($_POST['menu_group_id']) && !empty($_POST['menu_group_id'])){
                if ($api->databaseConnection()) {
                    $menu_group_id = $_POST['menu_group_id'];
                    $menu_group_write_access_right = $api->check_menu_access_rights($email_account, 1, 'write');
                    $menu_item_write_access_right = $api->check_menu_access_rights($email_account, 2, 'write');
                    $menu_item_delete_access_right = $api->check_menu_access_rights($email_account, 2, 'delete');

                    $sql = $api->db_connection->prepare('SELECT menu_id, menu_name, order_sequence FROM menu WHERE menu_group_id = :menu_group_id');
                    $sql->bindValue(':menu_group_id', $menu_group_id);
        
                    if($sql->execute()){
                        while($row = $sql->fetch()){
                            $menu_id = $row['menu_id'];
                            $menu_name = $row['menu_name'];
                            $order_sequence = $row['order_sequence'];

                            if($menu_item_write_access_right > 0 && $menu_group_write_access_right > 0){
                                $update = '<button type="button" class="btn btn-icon btn-info update-menu-item" title="Edit Menu Item">
                                                <i class="ti ti-pencil"></i>
                                            </button>';
                            }
                            else{
                                $update = null;
                            }
    
                            if($menu_item_delete_access_right > 0 && $menu_group_write_access_right > 0){
                                $delete = '<button type="button" class="btn btn-icon btn-danger delete-menu-item" title="Delete Menu Item">
                                                <i class="ti ti-trash"></i>
                                            </button>';
                            }
                            else{
                                $delete = null;
                            }
        
                            $response[] = array(
                                'MENU_ID' => $menu_id,
                                'MENU_NAME' => $menu_name,
                                'ORDER_SEQUENCE' => $order_sequence,
                                'ACTION' => '<div class="d-flex gap-2">
                                            '. $update .'
                                            '. $delete .'
                                        </div>'
                            );
                        }
        
                        echo json_encode($response);
                    }
                    else{
                        echo $sql->errorInfo()[2];
                    }
                }
            }
        break;
    }
}

?>