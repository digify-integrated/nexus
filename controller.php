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
                $username = htmlspecialchars($_POST['username'], ENT_QUOTES, 'UTF-8');
                $password = htmlspecialchars($_POST['password'], ENT_QUOTES, 'UTF-8');
    
                $authenticate = $api->authenticate($username, $password);
                
                if($authenticate === 'Authenticated'){
                    $_SESSION['lock'] = 0;
                    $_SESSION['logged_in'] = 1;
                    $_SESSION['username'] = $username;
                }
    
                $response[] = array(
                    'RESPONSE' => $authenticate,
                    'USERNAME' => $api->encrypt_data($username)
                );

                echo json_encode($response);
            }
        break;
        # -------------------------------------------------------------

        # Change password
        case 'change password':
            if(isset($_POST['username']) && !empty($_POST['username']) && isset($_POST['password']) && !empty($_POST['password'])){
                $username = htmlspecialchars($_POST['username'], ENT_QUOTES, 'UTF-8');
                $password = htmlspecialchars($api->encrypt_data($_POST['password']), ENT_QUOTES, 'UTF-8');
                $password_expiry_date = $api->format_date('Y-m-d', htmlspecialchars($system_date, ENT_QUOTES, 'UTF-8'), '+6 months');
    
                $check_user_account_exist = $api->check_user_account_exist($username);
     
                if($check_user_account_exist){
                    $check_password_history_exist = $api->check_password_history_exist($username, $_POST['password']);

                    if($check_password_history_exist == 0){
                        $update_user_account_password = $api->update_user_account_password($username, $password, $password_expiry_date);
    
                        if($update_user_account_password){
                            $insert_password_history = $api->insert_password_history($username, $password);
    
                            if($insert_password_history){
                                $update_login_attempt = $api->update_login_attempt($username, '', 0, NULL);
            
                                if($update_login_attempt){
                                    echo 'Updated';
                                }
                                else{
                                    echo $update_login_attempt;
                                }
                            }
                            else{
                                echo $insert_password_history;
                            }
                        }
                        else{
                            echo $update_user_account_password;
                        }
                    }
                    else{
                        echo 'Password Exist';
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