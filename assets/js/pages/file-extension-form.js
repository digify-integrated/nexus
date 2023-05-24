(function($) {
    'use strict';

    $(function() {
        initializeFileExtensionForm();

        if($('#file-extension-id').length){
            displayDetails('file extension details');
        }

        $(document).on('click','#discard-create',function() {
            discardCreate('file-extensions.php');
        });

        $(document).on('click','#edit-form',function() {
            displayDetails('file extension details');
        });

        $(document).on('click','#delete-file-extension',function() {
            const email_account = $('#email_account').text();
            const file_extension_id = $(this).data('file-extension-id');
            const transaction = 'delete file extension';
    
            Swal.fire({
                title: 'Confirm File Extension Deletion',
                text: 'Are you sure you want to delete this file extension?',
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
                        data: {email_account : email_account, file_extension_id : file_extension_id, transaction : transaction},
                        success: function (response) {
                            switch (response) {
                                case 'Deleted':
                                    setNotification('Deleted File Extension Success', 'The file extension has been deleted successfully.', 'success');
                                    window.location = 'file-extensions.php';
                                    break;
                                case 'Not Found':
                                    setNotification('Delete File Extension Error', 'The file extension does not exist.', 'danger');
                                    window.location = '404.php';
                                    break;
                                case 'User Not Found':
                                case 'Inactive User':
                                    window.location = 'logout.php?logout';
                                    break;
                                default:
                                    show_toastr('Delete File Extension Error', response, 'danger');
                                    break;
                            }
                        }
                    });
                    return false;
                }
            });
        });

        $(document).on('click','#duplicate-file-extension',function() {
            const email_account = $('#email_account').text();
            const file_extension_id = $(this).data('file-extension-id');
            const transaction = 'duplicate file extension';
    
            Swal.fire({
                title: 'Confirm File Extension Duplication',
                text: 'Are you sure you want to duplicate this file extension?',
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
                        data: {email_account : email_account, file_extension_id : file_extension_id, transaction : transaction},
                        dataType: 'JSON',
                        success: function (response) {
                            switch (response[0]['RESPONSE']) {
                                case 'Duplicated':
                                    setNotification('Duplicate File Extension Success', 'The file extension has been duplicated successfully.', 'success');
                                    window.location = 'file-extension-form.php?id=' + response[0]['FILE_EXTENSION_ID'];
                                    break;
                                case 'Not Found':
                                    setNotification('Duplicate File Extension Error', 'The source file extension does not exist.', 'danger');
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

function initializeFileExtensionForm(){
    $('#file-extension-form').validate({
        rules: {
            file_extension_name: {
                required: true
            },
            file_type_id: {
                required: true
            }
        },
        messages: {
            file_extension_name: {
                required: 'Please enter the file extension'
            },
            file_type_id: {
                required: 'Please choose the file type'
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
            const transaction = 'submit file extension';
          
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
                            setNotification('Insert File Extension Success', 'The file extension has been inserted successfully.', 'success');
                            window.location = window.location.href + '?id=' + response[0]['FILE_EXTENSION_ID'];
                            break;
                        case 'Updated':
                            setNotification('Update File Extension Success', 'The file extension has been updated successfully.', 'success');
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