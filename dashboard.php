<?php
    #require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Apps';

    require('views/_interface_settings.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include_once('views/_title.php'); ?>
    <?php include_once('views/_required_css.html'); ?>
</head>

<body>
    <?php 
        include_once('views/_preloader.html'); 
        include_once('views/_navbar.php'); 
        include_once('views/_header.php'); 
    ?>
    

    <?php 
        include_once('views/_required_js.html'); 
        include_once('views/_customizer.php'); 
    ?>
</body>

</html>