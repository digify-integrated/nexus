<?php
    require('session-check.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Nexus Integrated Solutions';

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
            <form class="auth-form" id="signin-form" method="post" action="#">
                <div class="card my-5">
                    <div class="card-body">
                        <div class="text-center">
                            <a href="#"><img src="<?php echo $login_logo; ?>" alt="img"></a>
                        </div>
                        <h4 class="text-center f-w-500 mb-3">Login with your email</h4>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" id="email" name="email" placeholder="Email Address">
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        </div>
                        <div class="d-flex mt-1 justify-content-between align-items-center">
                            <div class="form-check">
                                <input class="form-check-input input-primary" type="checkbox" id="remember-me">
                                <label class="form-check-label text-muted" for="remember-me">Remember me?</label>
                            </div>
                            <a href="forgot-password.php" class="text-secondary f-w-400 mb-0">Forgot Password?</a>
                        </div>
                        <div class="d-grid mt-4">
                            <button id="signin" type="submit" class="btn btn-primary">Login</button>
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