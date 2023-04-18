'use strict';

const bouncer = new Bouncer('[signin-form-validate]', {
  disableSubmit: true
});

document.addEventListener('bouncerFormInvalid', function (event) {
  window.scrollTo(0, event.detail.errors[0].offsetTop);
}, false);

document.addEventListener('bouncerFormValid', function () {
  const form = document.querySelector('[signin-form-validate]');
  const transaction = 'authenticate';

  $.ajax({
    type: 'POST',
    url: 'controller.php',
    data: $(form).serialize() + '&transaction=' + transaction,
    dataType: 'JSON',
    beforeSend: function() {
      disableFormSubmitButton('signin');
    },
    success: function (response) {
      switch (response[0]['RESPONSE']) {
        case 'Authenticated':
          const email = $('#email').val();
          sessionStorage.setItem('email', email);

          window.location = 'dashboard.php';
          break;
        case 'Incorrect':
          showNotification('Authentication Error', 'The username or password you entered is incorrect. Please double-check your credentials and try again.', 'danger');
          break;
        case 'Locked':
          showNotification('Authentication Error', 'Your account has been locked. Please contact your administrator for assistance.', 'danger');
          break;
        case 'Inactive':
          showNotification('Authentication Error', 'Your user account is currently inactive. Please contact your administrator for assistance.', 'danger');
          break;
        case 'Password Expired':
          setNotification('Authentication Error', 'Your password has expired. To keep your account secure, please create a new password to continue.', 'warning');
          window.location = 'reset-password.php?id=' + response[0]['EMAIL'];
          break;
        default:
          showNotification('Authentication Error', response, 'danger');
          break;
      }
    },
    complete: function() {
      enableFormSubmitButton('signin', 'Login');
    }
  });
}, false);