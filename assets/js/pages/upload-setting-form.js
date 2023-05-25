(function($) {
    'use strict';

    $(function() {
        initializeUploadSettingForm();

        if($('#upload-setting-id').length){
            displayDetails('upload settings details');
        }
        
        $(document).on('click','#discard-create',function() {
            discardCreate('upload-settings.php');
        });

        $(document).on('click','#edit-form',function() {
            displayDetails('upload settings details');
        });

        $(document).on('click','#delete-upload-setting',function() {
            const email_account = $('#email_account').text();
            const upload_setting_id = $(this).data('upload-setting-id');
            const transaction = 'delete upload setting';
    
            Swal.fire({
                title: 'Confirm Upload Setting Deletion',
                text: 'Are you sure you want to delete this upload setting?',
                icon: 'warning',
                showCancelButton: !0,
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-danger mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {email_account : email_account, upload_setting_id : upload_setting_id, transaction : transaction},
                        success: function (response) {
                            switch (response) {
                                case 'Deleted':
                                    setNotification('Deleted Upload Setting Success', 'The upload setting has been deleted successfully.', 'success');
                                    window.location = 'upload-settings.php';
                                    break;
                                case 'Not Found':
                                    setNotification('Delete Upload Setting Error', 'The upload setting does not exist.', 'danger');
                                    window.location = '404.php';
                                    break;
                                case 'User Not Found':
                                case 'Inactive User':
                                    window.location = 'logout.php?logout';
                                    break;
                                default:
                                    show_toastr('Delete Upload Setting Error', response, 'danger');
                                    break;
                            }
                        }
                    });
                    return false;
                }
            });
        });

        $(document).on('click','#duplicate-upload-setting',function() {
            const email_account = $('#email_account').text();
            const upload_setting_id = $(this).data('upload-setting-id');
            const transaction = 'duplicate upload setting';
    
            Swal.fire({
                title: 'Confirm Upload Setting Duplication',
                text: 'Are you sure you want to duplicate this upload setting?',
                icon: 'info',
                showCancelButton: !0,
                confirmButtonText: 'Duplicate',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-info mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {email_account : email_account, upload_setting_id : upload_setting_id, transaction : transaction},
                        dataType: 'JSON',
                        success: function (response) {
                            switch (response[0]['RESPONSE']) {
                                case 'Duplicated':
                                    setNotification('Duplicate Upload Setting Success', 'The upload setting has been duplicated successfully.', 'success');
                                    window.location = 'upload-setting-form.php?id=' + response[0]['FILE_TYPE_ID'];
                                    break;
                                case 'Not Found':
                                    setNotification('Duplicate Upload Setting Error', 'The source upload setting does not exist.', 'danger');
                                    window.location = '404.php';
                                    break;
                                case 'User Not Found':
                                case 'Inactive User':
                                    window.location = 'logout.php?logout';
                                    break;
                                default:
                                    setNotification('Transaction Error', response[0]['RESPONSE'], 'danger');
                                    break;
                            }
                        }
                    });
                    return false;
                }
            });
        });
    });
})(jQuery);

function initializeUploadSettingForm(){
    $('#upload-setting-form').validate({
        rules: {
            upload_setting_name: {
                required: true
            },
            upload_setting_description: {
                required: true
            },
            max_upload_size: {
                required: true
            }
        },
        messages: {
            upload_setting_name: {
                required: 'Please enter the upload setting name'
            },
            upload_setting_description: {
                required: 'Please enter the upload setting description'
            },
            max_upload_size: {
                required: 'Please enter the max upload size'
            }
        },
        errorPlacement: function (error, element) {
            if (element.hasClass('select2')) {
                error.insertAfter(element.next('.select2-container'));
            }
            else if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            }
            else {
                error.insertAfter(element);
            }
        },
        highlight: function(element) {
            if ($(element).hasClass('select2-hidden-accessible')) {
                $(element).next().find('.select2-selection__rendered').addClass('is-invalid');
            } 
            else {
                $(element).addClass('is-invalid');
            }
        },
        unhighlight: function(element) {
            if ($(element).hasClass('select2-hidden-accessible')) {
                $(element).next().find('.select2-selection__rendered').removeClass('is-invalid');
            }
            else {
                $(element).removeClass('is-invalid');
            }
        },
        submitHandler: function(form) {
            const email_account = $('#email_account').text();
            const transaction = 'submit upload setting';
          
            $.ajax({
                type: 'POST',
                url: 'controller.php',
                data: $(form).serialize() + '&email_account=' + email_account + '&transaction=' + transaction,
                dataType: 'JSON',
                beforeSend: function() {
                    disableFormSubmitButton('submit-data');
                },
                success: function (response) {
                    switch (response[0]['RESPONSE']) {
                        case 'Inserted':
                            setNotification('Insert Upload Setting Success', 'The upload setting has been inserted successfully.', 'success');
                            window.location = window.location.href + '?id=' + response[0]['UPLOAD_SETTING_ID'];
                            break;
                        case 'Updated':
                            setNotification('Update Upload Setting Success', 'The upload setting has been updated successfully.', 'success');
                            window.location.reload();
                            break;
                        case 'User Not Found':
                        case 'Inactive User':
                            window.location = 'logout.php?logout';
                            break;
                        default:
                            setNotification('Transaction Error', response, 'danger');
                            break;
                    }
                },
                complete: function() {
                    enableFormSubmitButton('submit-data', 'Save');
                }
            });
        
            return false;
        }
    });
}