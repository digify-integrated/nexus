<?php

class Api{
    # @var object $db_connection The database connection
    public $db_connection = null;

    public $response = array();

    const TIME_UNITS = [
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second'
    ];

    # -------------------------------------------------------------
    #   Custom methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : databaseConnection
    # Purpose    : Checks if database connection is opened.
    #              If not, then this method tries to open it.
    #              @return bool Success status of the
    #              database connecting process
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function databaseConnection(){
        if ($this->db_connection) {
            return $this->db_connection;
        }
    
        try {
            $this->db_connection = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8', DB_USER, DB_PASS);
            $this->db_connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch (PDOException $e) {
            throw new Exception('Error connecting to database: ' . $e->getMessage());
        }
    
        return $this->db_connection;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : backup_database
    # Purpose    : Backs-up the database.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function backup_database($file_name, $username){
        if ($this->databaseConnection()) {
            $backup_file = 'backup/' . $file_name . '_' . time() . '.sql';
    
            if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
                $cmd = sprintf('C:\xampp\mysql\bin\mysqldump.exe --routines --single-transaction -u %s -p%s %s -r %s',
                    escapeshellarg(DB_USER), escapeshellarg(DB_PASS), escapeshellarg(DB_NAME), escapeshellarg($backup_file)
                );
            }
            else {
                $cmd = sprintf('/usr/bin/mysqldump --routines --single-transaction -u %s -p%s %s -r %s',
                    escapeshellarg(DB_USER), escapeshellarg(DB_PASS), escapeshellarg(DB_NAME), escapeshellarg($backup_file)
                );
            }
            
            exec($cmd, $output, $return);
            
            if ($return === 0) {
                return true;
            } 
            else {
                return 'Error: mysqldump command failed with error code ' . $return;
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : format_date
    # Purpose    : Returns date with a custom formatting
    #              Avoids error when date is greater 
    #              than the year 2038 or less than 
    #              January 01, 1970.
    #
    # Returns    : Date
    #
    # -------------------------------------------------------------
    public function format_date($format, $date, $modify = null) {
        $dateTime = new DateTime($date);

        if ($modify) {
            $dateTime->modify($modify);
        }
        
        return $dateTime->format($format);
    }
    # -------------------------------------------------------------
    
    # -------------------------------------------------------------
    #
    # Name       : encrypt_data
    # Purpose    : Encrypt the text.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function encrypt_data($plaintext) {
        if (empty(trim($plaintext))) return false;

        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
        $ciphertext = openssl_encrypt(trim($plaintext), 'aes-256-cbc', ENCRYPTION_KEY, OPENSSL_RAW_DATA, $iv);
        
        if (!$ciphertext) return false;
        
        return rawurlencode(base64_encode($iv . $ciphertext));
    }
    # -------------------------------------------------------------
    
    # -------------------------------------------------------------
    #
    # Name       : decrypt_data
    # Purpose    : Decrypt the text.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function decrypt_data($ciphertext) {
        $ciphertext = base64_decode(rawurldecode($ciphertext));

        if (!$ciphertext) {
            return false;
        }
        
        $iv_length = openssl_cipher_iv_length('aes-256-cbc');

        if (strlen($ciphertext) < $iv_length) {
            return false;
        }
        
        $iv = substr($ciphertext, 0, $iv_length);
        $ciphertext = substr($ciphertext, $iv_length);
        
        $plaintext = openssl_decrypt($ciphertext, 'aes-256-cbc', ENCRYPTION_KEY, OPENSSL_RAW_DATA, $iv);
        
        if (!$plaintext) {
            return false;
        }
        
        return $plaintext;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : add_months
    # Purpose    : Add months to calculated date.
    #
    # Returns    : Number
    #
    # -------------------------------------------------------------
    public function add_months($months, DateTime $dateObject){
        $dateObject->modify('last day of +' . $months . ' month');
        $next = new DateTime($dateObject->format('Y-m-d'));

        return ($dateObject->format('d') > $next->format('d')) ? $dateObject->diff($next) : new DateInterval('P' . $months . 'M');        
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : validate_email
    # Purpose    : Validate if email is valid.
    #
    # Returns    : Number
    #
    # -------------------------------------------------------------
    public function validate_email($email) {
        $email = trim($email);

        if (empty($email)) {
            return 'Error: Missing email';
        }

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return 'Error: Invalid email';
        }
        return true;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : authenticate
    # Purpose    : Authenticates the user.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function authenticate($email, $password){
        if ($this->databaseConnection()) {
            $check_user_exist = $this->check_user_exist(null, $email);
           
            if($check_user_exist > 0){
                $user_details = $this->get_user_details(null, $email);
                $user_status = $user_details[0]['USER_STATUS'];
                $login_attempt = $user_details[0]['FAILED_LOGIN'];
                $password_expiry_date = $user_details[0]['PASSWORD_EXPIRY_DATE'];

                if($user_status == 'Active'){
                    if($login_attempt < 5){
                        $decrypted_password = $this->decrypt_data($user_details[0]['PASSWORD']);
                        
                        if($decrypted_password === $password){
                            if(strtotime(date('Y-m-d')) > strtotime($password_expiry_date)){
                                return 'Password Expired';
                            }
                            else{
                                $update_user_login_attempt = $this->update_user_login_attempt(null, $email, 0, null);

                                if($update_user_login_attempt){
                                    $update_user_last_connection = $this->update_user_last_connection(null, $email);

                                    if($update_user_last_connection){
                                        return 'Authenticated';
                                    }
                                    else{
                                        return $update_user_last_connection;
                                    }
                                }
                                else{
                                    return $update_user_login_attempt;
                                }
                            }
                        }
                        else{
                            $update_user_login_attempt = $this->update_user_login_attempt(null, $email, ($login_attempt + 1), date('Y-m-d H:i:s'));

                            if($update_user_login_attempt){
                                return 'Incorrect';
                            }
                            else{
                                return $update_user_login_attempt;
                            }
                        }
                    }
                    else{
                        return 'Locked';
                    }
                }
                else{
                    return 'Inactive';
                }

            }
            else{
                return 'Incorrect';
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : time_elapsed_string
    # Purpose    : returns the time elapsed
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function time_elapsed_string($datetime, $full = false, $units = TIME_UNITS) {
        $ago = DateTimeImmutable::createFromFormat('Y-m-d H:i:s', $datetime);
        
        if ($ago === false) {
            return 'Invalid datetime format';
        }
    
        $now = new DateTimeImmutable();
        $diff = $now->diff($ago);
    
        $elaped_time = [];
        
        foreach ($units as $unit => $label) {
            if ($diff->$unit) {
                $elaped_time[] = sprintf('%d %s%s', $diff->$unit, $label, $diff->$unit > 1 ? 's' : '');
                if (!$full) {
                    break;
                }
            }
        }
        return $elaped_time ? implode(', ', $elaped_time) . ' ago' : 'just now';
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : directory_checker
    # Purpose    : Checks the directory if it exists and create if not exist
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function directory_checker($directory) {
        if (!is_dir($directory)) {
            if (!mkdir($directory, 0755, true)) {
                $error = error_get_last();
                return 'Error creating directory: ' . $error['message'];
            }
        }
        else {
            if (!is_writable($directory)) {
                return 'Directory exists, but is not writable';
            }
        }

        return true;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Check data exist methods
    # -------------------------------------------------------------
    
    # -------------------------------------------------------------
    #
    # Name       : check_user_exist
    # Purpose    : Checks if the user exists.
    #
    # Returns    : Number
    #
    # -------------------------------------------------------------
    public function check_user_exist($p_user_id, $p_email_address){
        if ($this->databaseConnection()) {
            $sql = $this->db_connection->prepare('CALL check_user_exist(:p_user_id, :p_email_address)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email_address', $p_email_address);

            if($sql->execute()){
                $row = $sql->fetch();

                return (int) $row['total'];
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_password_history_exist
    # Purpose    : Checks if the password history exists.
    #
    # Returns    : Number
    #
    # -------------------------------------------------------------
    public function check_password_history_exist($p_user_id, $p_email, $p_password){
        if ($this->databaseConnection()) {
            $total = 0;

            $get_user_password_history_details = $this->get_user_password_history_details($p_user_id, $p_email);

            for($i = 0; $i < count($get_user_password_history_details); $i++) {
                $password_history = $this->decrypt_data($get_user_password_history_details[$i]['PASSWORD']);
                    
                if($password_history === $p_password){
                    $total = $total + 1;
                }
            }

            return (int) $total;
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Update methods
    # -------------------------------------------------------------
    
    # -------------------------------------------------------------
    #
    # Name       : update_user_login_attempt
    # Purpose    : Updates the login attempt of the user.
    #
    # Returns    : Number/String
    #
    # -------------------------------------------------------------
    public function update_user_login_attempt($p_user_id, $p_email_address, $p_login_attempt, $p_last_failed_attempt_date){
        if ($this->databaseConnection()) {
            $sql = $this->db_connection->prepare('CALL update_user_login_attempt(:p_user_id, :p_email_address, :p_login_attempt, :p_last_failed_attempt_date)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email_address', $p_email_address);
            $sql->bindValue(':p_login_attempt', $p_login_attempt);
            $sql->bindValue(':p_last_failed_attempt_date', $p_last_failed_attempt_date);

            if($sql->execute()){
                return true;
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : update_user_last_connection
    # Purpose    : Updates the last user connection date.
    #
    # Returns    : Number/String
    #
    # -------------------------------------------------------------
    public function update_user_last_connection($p_user_id, $p_email){
        if ($this->databaseConnection()) {
            $sql = $this->db_connection->prepare('CALL update_user_last_connection(:p_user_id, :p_email, :system_date)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email', $p_email);
            $sql->bindValue(':system_date', date('Y-m-d H:i:s'));

            if($sql->execute()){
                return true;
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : update_user_password
    # Purpose    : Updates the user password.
    #
    # Returns    : Number/String
    #
    # -------------------------------------------------------------
    public function update_user_password($p_user_id, $p_email, $p_password, $p_password_expiry_date){
        if ($this->databaseConnection()) {
            $sql = $this->db_connection->prepare('CALL update_user_password(:p_user_id, :p_email, :p_password, :p_password_expiry_date)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email', $p_email);
            $sql->bindValue(':p_password', $p_password);
            $sql->bindValue(':p_password_expiry_date', $p_password_expiry_date);

            if($sql->execute()){
                return true;
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Insert methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : insert_password_history
    # Purpose    : Inserts the user password history.
    #
    # Returns    : Number/String
    #
    # -------------------------------------------------------------
    public function insert_password_history($p_user_id, $p_email, $p_password){
        if ($this->databaseConnection()) {
            $sql = $this->db_connection->prepare('CALL insert_password_history(:p_user_id, :p_email, :p_password)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email', $p_email);
            $sql->bindValue(':p_password', $p_password);

            if($sql->execute()){
                return true;
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------
    
    # -------------------------------------------------------------
    #   Delete methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Get details methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : get_user_details
    # Purpose    : Gets the user details.
    #
    # Returns    : Array
    #
    # -------------------------------------------------------------
    public function get_user_details($p_user_id, $p_email_address){
        if ($this->databaseConnection()) {
            $response = array();

            $sql = $this->db_connection->prepare('CALL get_user_details(:p_user_id, :p_email_address)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email_address', $p_email_address);

            if($sql->execute()){
                while($row = $sql->fetch()){
                    $response[] = array(
                        'USER_ID' => $row['user_id'],
                        'EMAIL_ADDRESS' => $row['email_address'],
                        'PASSWORD' => $row['password'],
                        'FILE_AS' => $row['file_as'],
                        'USER_STATUS' => $row['user_status'],
                        'PASSWORD_EXPIRY_DATE' => $row['password_expiry_date'],
                        'FAILED_LOGIN' => $row['failed_login'],
                        'LAST_FAILED_LOGIN' => $row['last_failed_login'],
                        'LAST_CONNECTION_DATE' => $row['last_connection_date']
                    );
                }

                return $response;
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : get_user_password_history_details
    # Purpose    : Gets the user password history details.
    #
    # Returns    : Array
    #
    # -------------------------------------------------------------
    public function get_user_password_history_details($p_user_id, $p_email_address){
        if ($this->databaseConnection()) {
            $response = array();

            $sql = $this->db_connection->prepare('CALL get_user_password_history_details(:p_user_id, :p_email_address)');
            $sql->bindValue(':p_user_id', $p_user_id);
            $sql->bindValue(':p_email_address', $p_email_address);

            if($sql->execute()){
                while($row = $sql->fetch()){
                    $response[] = array(
                        'PASSWORD' => $row['password']
                    );
                }

                return $response;
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Get methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : get_file_as_format
    # Purpose    : Returns the file as name format
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function get_file_as_format($first_name, $middle_name = null, $last_name, $suffix = null){
        $suffix = $suffix ? $this->get_system_code_details(null, 'SUFFIX', $suffix)[0]['SYSTEM_DESCRIPTION'] : null;

        $name_parts = [$last_name, $first_name];
        if (!empty($middle_name)) {
            $name_parts[] = $middle_name;
        }
        if (!empty($suffix)) {
            $name_parts[] = $suffix;
        }

        return implode(', ', $name_parts);
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : get_default_image
    # Purpose    : returns the default image.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function get_default_image($type) {
        $defaultImages = [
            'profile' => DEFAULT_AVATAR_IMAGE,
            'login background' => DEFAULT_BG_IMAGE,
            'login logo' => DEFAULT_LOGIN_LOGO_IMAGE,
            'menu logo' => DEFAULT_MENU_LOGO_IMAGE,
            'module icon' => DEFAULT_MODULE_ICON_IMAGE,
            'favicon' => DEFAULT_FAVICON_IMAGE,
            'company logo' => DEFAULT_COMPANY_LOGO_IMAGE,
        ];
    
        return $defaultImages[$type] ?? DEFAULT_PLACEHOLDER_IMAGE;
    }
    # -------------------------------------------------------------
    
    # -------------------------------------------------------------
    #
    # Name       : get_access_rights_count
    # Purpose    : Gets the roles' access right count based on access type.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function get_access_rights_count($role_id, $access_right_id, $access_type){
        if ($this->databaseConnection()) {
            $sql = $this->db_connection->prepare('CALL get_access_rights_count(:role_id, :access_right_id, :access_type)');
            $sql->bindValue(':role_id', $role_id);
            $sql->bindValue(':access_right_id', $access_right_id);
            $sql->bindValue(':access_type', $access_type);

            if($sql->execute()){
                $row = $sql->fetch();

                return (int) $row['TOTAL'];
            }
            else{
                return $stmt->errorInfo()[2];
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : get_user_status
    # Purpose    : Returns the status, badge.
    #
    # Returns    : Array
    #
    # -------------------------------------------------------------
    public function get_user_status($user_status){
        $status = ($user_status === 'Active') ? 'Active' : 'Deactivated';
        $button_class = ($user_status === 'Active') ? 'bg-success' : 'bg-danger';

        $response[] = array(
            'STATUS' => $status,
            'BADGE' => '<span class="badge ' . $button_class . '">' . $status . '</span>'
        );

        return $response;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Check methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_modal_scrollable
    # Purpose    : Check if the modal to be generated
    #              is scrollable or not.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function check_modal_scrollable($scrollable){
        return $scrollable ? 'modal-dialog-scrollable' : null;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_modal_size
    # Purpose    : Check the size of the modal.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function check_modal_size($size){
        $sizes = ['SM' => 'modal-sm', 'LG' => 'modal-lg', 'XL' => 'modal-xl'];

        return $sizes[$size] ?? null;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_number
    # Purpose    : Checks the number if empty or 0 
    #              return 0 or return number given.
    #
    # Returns    : Number
    #
    # -------------------------------------------------------------
    public function check_number($number){
        return is_numeric($number) && $number > 0 && !empty($number) ? $number : '0';
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_date
    # Purpose    : Checks the date with different format
    #
    # Returns    : Date
    #
    # -------------------------------------------------------------
    public function check_date($type, $date, $time, $format, $modify, $system_date, $current_time){
        if($type == 'default'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify);
            }
            else{
                return $system_date;
            }
        }
        else if($type == 'empty'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify);
            }
            else{
                return null;
            }
        }
        else if($type == 'attendance empty'){
            if(!empty($date) && $date != ' '){
                return $this->format_date($format, $date, $modify);
            }
            else{
                return null;
            }
        }
        else if($type == 'summary'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify);
            }
            else{
                return '--';
            }
        }
        else if($type == 'na'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify);
            }
            else{
                return 'N/A';
            }
        }
        else if($type == 'complete'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify) . ' ' . $time;
            }
            else{
                return 'N/A';
            }
        }
        else if($type == 'encoded'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify) . ' ' . $time;
            }
            else{
                return 'N/A';
            }
        }
        else if($type == 'date time'){
            if(!empty($date)){
                return $this->format_date($format, $date, $modify) . ' ' . $time;
            }
            else{
                return 'N/A';
            }
        }
        else if($type == 'default time'){
            if(!empty($date)){
                return $time;
            }
            else{
                return $current_time;
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_image
    # Purpose    : Checks the image.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function check_image($image, $type){
        $image = $image ?? '';
        
        return (empty($image) || !file_exists($image)) ? $this->get_default_image($type) : $image;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : check_user_status
    # Purpose    : Checks the user account status. 
    #
    # Returns    : Date
    #
    # -------------------------------------------------------------
    public function check_user_status($p_user_id, $p_email_address){
        if ($this->databaseConnection()) {
            $user_details = $this->get_user_details($p_user_id, $p_email_address);
            $user_status = $user_details[0]['USER_STATUS'];
            $failed_login = $user_details[0]['FAILED_LOGIN'];

            return ($user_status == 'Active' && $failed_login < 5) ? true : false;
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Generate methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #
    # Name       : generate_file_name
    # Purpose    : generates random file name.
    #
    # Returns    : String
    #
    # -------------------------------------------------------------
    public function generate_file_name($length, $prefix = '') {
        $keys = str_split('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
        $maxIndex = count($keys) - 1;

        $key = $prefix . array_reduce(array_fill(0, $length, null), function ($carry, $val) use ($keys, $maxIndex) {
            return $carry . $keys[random_int(0, $maxIndex)];
        }) . uniqid('', true);

        return $key;        
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Generate options methods
    # -------------------------------------------------------------

}

?>