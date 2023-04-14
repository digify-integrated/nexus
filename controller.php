<?php
session_start();
require('config/config.php');
require('classes/api.php');

if(isset($_POST['transaction']) && !empty($_POST['transaction'])){
    $transaction = htmlspecialchars($_POST['transaction'], ENT_QUOTES, 'UTF-8');
    $api = new Api;
    $system_date = date('Y-m-d');
    $current_time = date('H:i:s');

    switch ($transaction) {
        # Authenticate
        case 'authenticate':
            if(isset($_POST['password']) && !empty($_POST['password'])){
                $response = array();
                $email = htmlspecialchars($_POST['email'], ENT_QUOTES, 'UTF-8');
                $password = htmlspecialchars($_POST['password'], ENT_QUOTES, 'UTF-8');
    
                $authenticate = $api->authenticate($email, $password);
                
                if($authenticate === 'Authenticated'){                    
                    $_SESSION['logged_in'] = 1;
                    $_SESSION['email'] = $email;

                    if(isset($_POST['remember_me'])){
                        $cookie_name = 'remember_me';
                        $cookie_value = $email;
                        $cookie_expiry = time() + (30 * 24 * 60 * 60);
                        
                        setcookie($cookie_name, $cookie_value, $cookie_expiry, '/');
                    }

                    $response[] = array(
                        'RESPONSE' => $authenticate
                    );
                }
                else if($authenticate === 'Password Expired'){
                    $response[] = array(
                        'RESPONSE' => $authenticate,
                        'EMAIL' => $api->encrypt_data($email)
                    );
                }
                else{
                    $response[] = array(
                        'RESPONSE' => $authenticate
                    );
                }

                echo json_encode($response);
            }
        break;
        # -------------------------------------------------------------

        # Reset password
        case 'reset password':
            if(isset($_POST['email']) && !empty($_POST['email']) && isset($_POST['password']) && !empty($_POST['password'])){
                $email = htmlspecialchars($_POST['email'], ENT_QUOTES, 'UTF-8');
                $password = htmlspecialchars($api->encrypt_data($_POST['password']), ENT_QUOTES, 'UTF-8');
                $password_expiry_date = $api->format_date('Y-m-d', htmlspecialchars($system_date, ENT_QUOTES, 'UTF-8'), '+6 months');
    
                $check_user_exist = $api->check_user_exist(null, $email);
     
                if($check_user_exist){
                    $user_details = $api->get_user_details(null, $email);
                    $user_id = $user_details[0]['USER_ID'];

                    $check_user_status = $api->check_user_status($user_id, $email);

                    if($check_user_status){
                        $check_password_history_exist = $api->check_password_history_exist($user_id, $email, $_POST['password']);

                        if($check_password_history_exist == 0){
                            $update_user_password = $api->update_user_password($user_id, $email, $password, $password_expiry_date);
        
                            if($update_user_password){
                                $insert_password_history = $api->insert_password_history($user_id, $email, $password);
        
                                if($insert_password_history){
                                    $update_user_login_attempt = $api->update_user_login_attempt($user_id, $email, 0, null);

                                    if($update_user_login_attempt){
                                        echo 'Updated';
                                    }
                                    else{
                                        echo $update_user_login_attempt;
                                    }
                                }
                                else{
                                    echo $insert_password_history;
                                }
                            }
                            else{
                                echo $update_user_password;
                            }
                        }
                        else{
                            echo 'Password Exist';
                        }
                    }
                    else{
                        echo 'Inactive';
                    }
                }
                else{
                    echo 'Not Found';
                }
            }
        break;
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Submit transactions
        # -------------------------------------------------------------

        # Submit user ui customization setting
        case 'submit user ui customization setting':
            if(isset($_POST['email']) && !empty($_POST['email']) && isset($_POST['type']) && !empty($_POST['type']) && isset($_POST['customization_value'])){
                $email = htmlspecialchars($_POST['email'], ENT_QUOTES, 'UTF-8');

                $check_user_exist = $api->check_user_exist(null, $email);
     
                if($check_user_exist){
                    $check_user_status = $api->check_user_status(null, $email);
    
                    if($check_user_status){
                        $type = htmlspecialchars($_POST['type'], ENT_QUOTES, 'UTF-8');
                        $customization_value = htmlspecialchars($_POST['customization_value'], ENT_QUOTES, 'UTF-8');

                        $user_details = $api->get_user_details(null, $email);
                        $user_id = $user_details[0]['USER_ID'];

                        $check_ui_customization_setting_exist = $api->check_ui_customization_setting_exist($user_id, $email);
        
                        if($check_ui_customization_setting_exist > 0){
                            $update_ui_customization_setting = $api->update_ui_customization_setting($user_id, $email, $type, $customization_value, $user_id);
                
                            if($update_ui_customization_setting){
                                echo 'Updated';
                            }
                            else{
                                echo $update_ui_customization_setting;
                            }
                        }
                        else{
                            $insert_ui_customization_setting = $api->insert_ui_customization_setting($user_id, $email, $type, $customization_value, $user_id);
                
                            if($insert_ui_customization_setting){
                                echo 'Updated';
                            }
                            else{
                                echo $insert_ui_customization_setting;
                            }
                        }
                    }
                    else{
                        echo 'Inactive User';
                    }
                }
                else{
                    echo 'Not Found';
                }
            }
        break;
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Delete transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Unlock transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Lock transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Activate transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Deactivate transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Archive transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Unarchive transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Start transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Stop transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Cancel transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   For approval transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   For recommendation transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Reject transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Recommend transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Pending transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Tag for approval transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Approve transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Notification transactions
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        #   Get details transactions
        # -------------------------------------------------------------

        case 'ui customization settings details':
            if(isset($_POST['email']) && !empty($_POST['email'])){
                $email = htmlspecialchars($_POST['email'], ENT_QUOTES, 'UTF-8');

                $ui_customization_setting_details = $api->get_ui_customization_setting_details(null, $email);
    
                $response[] = array(
                    'THEME_CONTRAST' => $ui_customization_setting_details[0]['THEME_CONTRAST'] ?? 'false',
                    'CAPTION_SHOW' => $ui_customization_setting_details[0]['CAPTION_SHOW'] ?? 'true',
                    'PRESET_THEME' => $ui_customization_setting_details[0]['PRESET_THEME'] ?? 'preset-1',
                    'DARK_LAYOUT' => $ui_customization_setting_details[0]['DARK_LAYOUT'] ?? 'false',
                    'RTL_LAYOUT' => $ui_customization_setting_details[0]['RTL_LAYOUT'] ?? 'false',
                    'BOX_CONTAINER' => $ui_customization_setting_details[0]['BOX_CONTAINER'] ?? 'false'
                );
    
                echo json_encode($response);
            }
        break;

        case 'menu groups details':
            if(isset($_POST['menu_group_id']) && !empty($_POST['menu_group_id'])){
                $menu_group_id = htmlspecialchars($_POST['menu_group_id'], ENT_QUOTES, 'UTF-8');

                $menu_groups_details = $api->get_menu_groups_details($menu_group_id);
    
                $response[] = array(
                    'MENU_GROUP_NAME' => $menu_groups_details[0]['MENU_GROUP_NAME'],
                    'ORDER_SEQUENCE' => $menu_groups_details[0]['ORDER_SEQUENCE']
                );
    
                echo json_encode($response);
            }
        break;
    }
}

?>