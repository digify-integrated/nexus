(function($) {
    'use strict';

    $(function() {
        checkNotification();

        if ($('#email_account').length) {
            const email_account = $('#email_account').text();
            getCustomization(email_account);
        }
        
    });
})(jQuery);

function disableFormSubmitButton(buttonId) {
    try {
      const submitButton = document.querySelector(`#${buttonId}`);
      const { disabled, innerHTML } = submitButton;
  
      submitButton.disabled = true;
      submitButton.innerHTML = '<div class="spinner-border spinner-border-sm text-light" role="status"><span class="sr-only"></span></div>';
    }
    catch (error) {
      console.error(error);
    }
}
  
function enableFormSubmitButton(buttonId, buttonText) {
    try {
      const submitButton = document.querySelector(`#${buttonId}`);
      const { disabled, innerHTML } = submitButton;
  
      submitButton.disabled = false;
      submitButton.innerHTML = buttonText;
    }
    catch (error) {
      console.error(error);
    }
}

function showNotification(notificationTitle, notificationMessage, notificationType) {
    const notificationIcons = {
        success: './assets/images/notification/ok-48.png',
        danger: './assets/images/notification/high_priority-48.png',
        info: './assets/images/notification/survey-48.png',
        warning: './assets/images/notification/medium_priority-48.png',
        default: './assets/images/notification/clock-48.png'
    };
  
    const icon = notificationIcons[notificationType] || notificationIcons.default;
    const duration = (notificationType === 'danger' || notificationType === 'warning') ? 6000 : 4000;
  
    notifier.show(notificationTitle, notificationMessage, notificationType, icon, duration);
}

function setNotification(notificationTitle, notificationMessage, notificationType){
    sessionStorage.setItem('notificationTitle', notificationTitle);
    sessionStorage.setItem('notificationMessage', notificationMessage);
    sessionStorage.setItem('notificationType', notificationType);
}

function checkNotification(){
    const { 
        'notificationTitle': notificationTitle, 
        'notificationMessage': notificationMessage, 
        'notificationType': notificationType 
    } = sessionStorage;
    
    if (notificationTitle && notificationMessage && notificationType) {
        sessionStorage.removeItem('notificationTitle');
        sessionStorage.removeItem('notificationMessage');
        sessionStorage.removeItem('notificationType');

        showNotification(notificationTitle, notificationMessage, notificationType);
    }
}

function saveCustomization(type, customization_value){
    const email = $('#email_account').text();
    const transaction = 'submit user ui customization setting';

    $.ajax({
        type: 'POST',
        url: 'controller.php',
        data: {transaction : transaction, email : email, type : type, customization_value : customization_value},
        dataType: 'TEXT',
        success: function (response) {
            switch (response) {
                case 'Updated':
                    showNotification('Update UI Settings Success', 'The UI settings has been updated successfully.', 'success');
                    break;
                case 'Not Found':
                    showNotification('Update UI Settings Error', 'Your user account does not exist.', 'danger');
                    break;
                default:
                    showNotification('Update UI Settings Error', response, 'danger');
                    break;
            }
        }
    });
}

function getCustomization(email){
    const transaction = 'ui customization settings details';

    $.ajax({
        url: 'controller.php',
        method: 'POST',
        dataType: 'JSON',
        data: {email : email, transaction : transaction},
        success: function(response) {
            sessionStorage.setItem('theme_contrast', response[0].THEME_CONTRAST);
            sessionStorage.setItem('caption_show', response[0].CAPTION_SHOW);
            sessionStorage.setItem('preset_theme', response[0].PRESET_THEME);
            sessionStorage.setItem('dark_layout', response[0].DARK_LAYOUT);
            sessionStorage.setItem('rtl_layout', response[0].RTL_LAYOUT);
            sessionStorage.setItem('box_container', response[0].BOX_CONTAINER);
        }
    });
}