<?php
    require('session-check.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Reset Password';

    require('views/_interface_settings.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include_once('views/_title.php'); ?>
    <?php include_once('views/_required_css.html'); ?>
</head>

<body>
    <?php include_once('views/_preloader.html'); ?>

    <div class="auth-main">
        <div class="auth-wrapper v2">
            <div class="auth-sidecontent">
                <img src="<?php echo $login_background; ?>" alt="images" class="img-fluid img-auth-side">
            </div>
            <form class="auth-form" id="reset-password-form" method="post" action="#">
                <div class="card my-5">
                    <div class="card-body">
                        <div class="text-center">
                            <a href="#"><img src="<?php echo $login_logo; ?>" alt="img"></a>
                        </div>
                        <div class="mb-4">
                            <h3 class="mb-2"><b>Reset Password</b></h3>
                            <p class="text-muted">Please enter your new password</p>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password">
                        </div>
                        <div class="d-grid mt-4">
                            <button id="reset-password" type="submit" class="btn btn-primary">Reset Password</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <?php 
        include_once('views/_required_js.html'); 
        include_once('views/_customizer.php'); 
    ?>
</body>

</html>