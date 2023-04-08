CREATE TABLE audit_log (
  audit_log_id int(50) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
  table_name varchar(255) NOT NULL,
  reference_id int(10) NOT NULL,
  log TEXT NOT NULL,
  changed_by varchar(255) NOT NULL,
  changed_at datetime NOT NULL
);

CREATE INDEX audit_log_index_audit_log_id ON audit_log(audit_log_id);

CREATE TABLE users (
    user_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email_address VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(500) NOT NULL,
    file_as VARCHAR(300) NOT NULL,
    user_status CHAR(10) NOT NULL,
    password_expiry_date DATE NOT NULL,
    failed_login TINYINT(1) NOT NULL DEFAULT 0,
    last_failed_login DATETIME DEFAULT NULL,
    last_connection_date DATETIME DEFAULT NULL,
    last_log_by INT(10) NOT NULL
);

CREATE TRIGGER users_trigger_update
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    IF NEW.user_status <> OLD.user_status THEN
        SET audit_log = CONCAT(audit_log, "user_status: ", OLD.user_status, " -> ", NEW.user_status, "<br/>");
    END IF;

    IF NEW.password_expiry_date <> OLD.password_expiry_date THEN
        SET audit_log = CONCAT(audit_log, "password_expiry_date: ", OLD.password_expiry_date, " -> ", NEW.password_expiry_date, "<br/>");
    END IF;

    IF NEW.failed_login <> OLD.failed_login THEN
        SET audit_log = CONCAT(audit_log, "failed_login: ", OLD.failed_login, " -> ", NEW.failed_login, "<br/>");
    END IF;

    IF NEW.last_failed_login <> OLD.last_failed_login THEN
        SET audit_log = CONCAT(audit_log, "last_failed_login: ", OLD.last_failed_login, " -> ", NEW.last_failed_login, "<br/>");
    END IF;

    IF NEW.last_connection_date <> OLD.last_connection_date THEN
        SET audit_log = CONCAT(audit_log, "last_connection_date: ", OLD.last_connection_date, " -> ", NEW.last_connection_date, "<br/>");
    END IF;
    
    IF LENGTH(audit_log) > 0 THEN
        INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
        VALUES ('users', NEW.user_id, audit_log, NEW.last_log_by, NOW());
    END IF;
END //

CREATE TRIGGER users_trigger_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT 'User created.';

    IF NEW.email_address <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>email_address: ", NEW.email_address);
    END IF;

    IF NEW.file_as <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>file_as: ", NEW.file_as);
    END IF;

    IF NEW.user_status <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>user_status: ", NEW.user_status);
    END IF;

    IF NEW.password_expiry_date <> '' THEN
        SET audit_log = CONCAT(audit_log, "<br/>password_expiry_date: ", NEW.password_expiry_date);
    END IF;

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('users', NEW.user_id, audit_log, NEW.last_log_by, NOW());
END //

CREATE TRIGGER users_trigger_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    DECLARE audit_log TEXT DEFAULT '';

    SET audit_log = CONCAT(audit_log, "The user '", OLD.user_id, "' has been deleted.");

    INSERT INTO audit_log (table_name, reference_id, log, changed_by, changed_at) 
    VALUES ('users', OLD.user_id, audit_log, OLD.last_log_by, NOW());
END //

CREATE INDEX users_index_user_id ON users(user_id);
CREATE INDEX users_index_email_address ON users(email_address);
CREATE INDEX users_index_user_status ON users(user_status);
CREATE INDEX users_index_password_expiry_date ON users(password_expiry_date);
CREATE INDEX users_index_last_connection_date ON users(last_connection_date);

INSERT INTO users (email_address, password, file_as, user_status, password_expiry_date, failed_login, last_log_by) VALUES ('admin@encorefinancials.com', 'W5hvx4P278F8q50uZe2YFif%2ByRDeSeNaainzl5K9%2BQM%3D', 'Administrator', 'Active', '2022-12-30', 0, 1);
INSERT INTO users (email_address, password, file_as, user_status, password_expiry_date, failed_login, last_log_by) VALUES ('ldagulto@encorefinancials.com', 'W5hvx4P278F8q50uZe2YFif%2ByRDeSeNaainzl5K9%2BQM%3D', 'Administrator', 'Active', '2022-12-30', 0, 1);
INSERT INTO users (email_address, password, file_as, user_status, password_expiry_date, failed_login, last_log_by) VALUES ('lmicayas@encorefinancials.com', 'W5hvx4P278F8q50uZe2YFif%2ByRDeSeNaainzl5K9%2BQM%3D', 'Administrator', 'Active', '2022-12-30', 0, 1);

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

CREATE INDEX password_history_index_password_history_id ON password_history(password_history_id);
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

CREATE TABLE ui_customization_setting (
    ui_customization_setting_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_id INT(10) UNSIGNED NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    theme_contrast VARCHAR(15),
    caption_show VARCHAR(15),
    preset_theme VARCHAR(15),
    dark_layout VARCHAR(15),
    rtl_layout VARCHAR(15),
    box_container VARCHAR(15)
);

ALTER TABLE ui_customization_setting
ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE ui_customization_setting
ADD FOREIGN KEY (email_address) REFERENCES users(email_address);

CREATE INDEX ui_customization_setting_index_ui_customization_setting_id ON ui_customization_setting(ui_customization_setting_id);
CREATE INDEX ui_customization_setting_index_user_id ON ui_customization_setting(user_id);
CREATE INDEX ui_customization_setting_index_email_address ON ui_customization_setting(email_address);

CREATE PROCEDURE check_ui_customization_setting_exist(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT COUNT(*) AS total
    FROM ui_customization_setting
    WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //

CREATE PROCEDURE insert_ui_customization_setting(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_type VARCHAR(30), IN p_customization_value VARCHAR(15))
BEGIN
	IF p_type = 'theme_contrast' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, theme_contrast) 
	    VALUES(p_user_id, p_email_address, p_customization_value);
    ELSEIF p_type = 'caption_show' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, caption_show) 
	    VALUES(p_user_id, p_email_address, p_customization_value);
    ELSEIF p_type = 'preset_theme' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, preset_theme) 
	    VALUES(p_user_id, p_email_address, p_customization_value);
    ELSEIF p_type = 'dark_layout' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, dark_layout) 
	    VALUES(p_user_id, p_email_address, p_customization_value);
    ELSEIF p_type = 'rtl_layout' THEN
        INSERT INTO ui_customization_setting (user_id, email_address, rtl_layout) 
	    VALUES(p_user_id, p_email_address, p_customization_value);
    ELSE
        INSERT INTO ui_customization_setting (user_id, email_address, box_container) 
	    VALUES(p_user_id, p_email_address, p_customization_value);
    END IF;
END //

CREATE PROCEDURE update_ui_customization_setting(IN p_user_id INT(10), IN p_email_address VARCHAR(100), IN p_type VARCHAR(30), IN p_customization_value VARCHAR(15))
BEGIN
	IF p_type = 'theme_contrast' THEN
        UPDATE ui_customization_setting
        SET theme_contrast = p_customization_value
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'caption_show' THEN
        UPDATE ui_customization_setting
        SET caption_show = p_customization_value
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'preset_theme' THEN
        UPDATE ui_customization_setting
        SET preset_theme = p_customization_value
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'dark_layout' THEN
        UPDATE ui_customization_setting
        SET dark_layout = p_customization_value
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSEIF p_type = 'rtl_layout' THEN
        UPDATE ui_customization_setting
        SET rtl_layout = p_customization_value
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    ELSE
        UPDATE ui_customization_setting
        SET box_container = p_customization_value
       	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
    END IF;
END //

CREATE PROCEDURE get_ui_customization_setting_details(IN p_user_id INT(10), IN p_email_address VARCHAR(100))
BEGIN
    SELECT ui_customization_setting_id, user_id, email_address, theme_contrast, caption_show, preset_theme, dark_layout, rtl_layout, box_container
	FROM ui_customization_setting 
	WHERE user_id = p_user_id OR email_address = BINARY p_email_address;
END //
