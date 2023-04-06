/* Users Table */
CREATE TABLE users (
    user_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(500) NOT NULL,
    file_as VARCHAR(300) NOT NULL,
    user_status CHAR(10) NOT NULL,
    password_expiry_date DATE NOT NULL,
    failed_login TINYINT(1) NOT NULL DEFAULT 0,
    last_failed_login DATETIME DEFAULT NULL,
    last_connection_date DATETIME DEFAULT NULL
);

CREATE INDEX users_index_user_id ON users(user_id);
CREATE INDEX users_index_email_address ON users(email_address);
CREATE INDEX users_index_user_status ON users(user_status);
CREATE INDEX users_index_password_expiry_date ON users(password_expiry_date);
CREATE INDEX users_index_last_connection_date ON users(last_connection_date);

INSERT INTO users (email_address, password, file_as, user_status, password_expiry_date, failed_login) VALUES ('admin@encorefinancials.com', '68aff5412f35ed76', 'Administrator', 'Active', '2022-12-30', 0);

CREATE PROCEDURE check_user_exist(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT COUNT(*) AS total
    FROM users
    WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //

CREATE PROCEDURE get_user_details(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
	SELECT user_id, email_address, password, file_as, user_status, password_expiry_date, failed_login, last_failed_login, last_connection_date 
	FROM users 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //

CREATE PROCEDURE update_user_login_attempt(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_login_attempt TINYINT(1), IN p_last_failed_attempt_date DATETIME)
BEGIN
    IF p_login_attempt > 0 THEN
        UPDATE users
        SET failed_login = p_login_attempt,
            last_failed_login = p_last_failed_attempt_date
        WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSE
        UPDATE users
        SET failed_login = p_login_attempt
        WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    END IF;
END//

CREATE PROCEDURE update_user_last_connection(IN p_user_id INT(10), IN p_email_address VARCHAR(100), p_last_connection_date DATETIME)
BEGIN
	UPDATE users 
	SET last_connection_date = p_last_connection_date
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //

CREATE PROCEDURE update_user_password(IN p_user_id INT(10), IN p_email_address VARCHAR(100), p_password VARCHAR(500), p_password_expiry_date DATE)
BEGIN
	UPDATE users 
	SET PASSWORD = p_password, PASSWORD_EXPIRY_DATE = p_password_expiry_date
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //

CREATE PROCEDURE update_user(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_password VARCHAR(500), IN p_file_as VARCHAR (300), IN p_password_expiry_date DATE)
BEGIN
	IF p_password IS NOT NULL AND p_password <> '' THEN
        UPDATE users
        SET file_as = p_file_as, password = p_password, password_expiry_date = p_password_expiry_date
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSE
        UPDATE users
        SET file_as = p_file_as
      	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    END IF;
END //

CREATE PROCEDURE insert_user(IN p_email_address VARCHAR(100), IN p_password VARCHAR(500), IN p_file_as VARCHAR (300), IN p_password_expiry_date DATE)
BEGIN
	INSERT INTO users (email_address, password, file_as, user_status, password_expiry_date, failed_login) 
	VALUES(p_email_address, p_password, p_file_as, "Inactive", p_password_expiry_date, 0);
END //

CREATE PROCEDURE delete_user(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
	DELETE FROM users 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //

CREATE TABLE password_history (
    password_history_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_id INT(10) UNSIGNED NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    password VARCHAR(500) NOT NULL,
    password_change_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE password_history
ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE password_history
ADD FOREIGN KEY (email_address) REFERENCES users(email_address);

CREATE INDEX password_history_index_user_id ON password_history(user_id);
CREATE INDEX password_history_index_email_address ON password_history(email_address);

CREATE PROCEDURE insert_password_history(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_password VARCHAR(500))
BEGIN
	INSERT INTO password_history (user_id, email_address, password) 
	VALUES(p_user_id, p_email_address, p_password);
END //

CREATE PROCEDURE get_user_password_history_details(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT password 
	FROM password_history 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //