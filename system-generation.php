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
    
                        $response[] = array(
                            'CHECK_BOX' => '<input class="form-check-input datatable-checkbox-children" type="checkbox" value="'. $menu_group_id_encrypted .'">',
                            'MENU_GROUP_ID' => $menu_group_id,
                            'MENU_GROUP_NAME' => $menu_group_name,
                            'ORDER_SEQUENCE' => $order_sequence,
                            'VIEW' => '<div class="d-flex gap-2">
                                            <a href="menu-group-form.php?id='. $menu_group_id_encrypted .'" class="btn btn-icon btn-primary" title="View Menu Group">
                                                <i class="ti ti-eye"></i>
                                            </a>
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
    }
}

?>