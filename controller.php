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

    }
}

?>