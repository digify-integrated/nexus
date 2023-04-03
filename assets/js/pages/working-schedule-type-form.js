(function($) {
    'use strict';

    $(function() {
        if($('#working-schedule-type-id').length){
            display_details('working schedule type details');
        }

        $('#working-schedule-type-form').validate({
            submitHandler: function (form) {
                const transaction = 'submit working schedule type';
                const username = $('#username').text();

                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: $(form).serialize() + '&username=' + username + '&transaction=' + transaction,
                    dataType: 'JSON',
                    beforeSend: function(){
                        document.getElementById('submit-data').disabled = true;
                        $('#submit-data').html('<div class="spinner-border spinner-border-sm text-light" role="status"><span rclass="sr-only"></span></div>');
                    },
                    success: function (response) {
                        switch (response[0]['RESPONSE']) {
                            case 'Inserted':
                                set_toastr('Working Schedule Type Inserted', 'The working schedule type has been inserted successfully.', 'success');
                                window.location = window.location.href + '?id=' + response[0]['WORKING_SCHEDULE_TYPE_ID'];
                                break;
                            case 'Updated':
                                set_toastr('Working Schedule Type Updated', 'The working schedule type has been updated successfully.', 'success');
                                window.location.reload();
                                break;
                            case 'Inactive User':
                                window.location = '404.php';
                                break;
                            default:
                                show_toastr('Transaction Error', response, 'error');
                                break;
                        }
                    },
                    complete: function(){
                        document.getElementById('submit-data').disabled = false;
                        $('#submit-data').html('<span class="d-block d-sm-none"><i class="bx bx-save"></i></span><span class="d-none d-sm-block">Save</span>');
                    }
                });
                return false;
            },
            rules: {
                working_schedule_type: {
                    required: true
                },
                working_schedule_type_category: {
                    required: true
                },
            },
            messages: {
                working_schedule_type: {
                    required: 'Please enter the working schedule type',
                },
                working_schedule_type_category: {
                    required: 'Please choose the working schedule type category',
                }
            },
            errorPlacement: function(label) {                
                show_toastr('Form Validation', label.text(), 'error');
            },
            highlight: function(element) {
                if ($(element).hasClass('select2-hidden-accessible')) {
                    $(element).next().find('.select2-selection').addClass('is-invalid');
                } 
                else {
                    $(element).addClass('is-invalid');
                }
            },
            unhighlight: function(element) {
                if ($(element).hasClass('select2-hidden-accessible')) {
                    $(element).next().find('.select2-selection').removeClass('is-invalid');
                }
                else {
                    $(element).removeClass('is-invalid');
                }
            }
        });

        initialize_click_events();
    });
})(jQuery);

function initialize_click_events(){
    const username = $('#username').text();

    $(document).on('click','#delete-working-schedule-type',function() {
        const working_schedule_type_id = $(this).data('working-schedule-type-id');
        const transaction = 'delete working schedule type';

        Swal.fire({
            title: 'Confirm Working Schedule Type Deletion',
            text: 'Are you sure you want to delete this working schedule type?',
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
                    data: {username : username, working_schedule_type_id : working_schedule_type_id, transaction : transaction},
                    success: function (response) {
                        switch (response) {
                            case 'Deleted':
                                set_toastr('Working Schedule Type Deleted', 'The working schedule type has been deleted successfully.', 'success');
                                window.location = 'working-schedule-types.php';
                                break;
                            case 'Inactive User':
                            case 'Not Found':
                                window.location = '404.php';
                                break;
                            default:
                                show_toastr('User Working Schedule Type Error', response, 'error');
                                break;
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#discard-create',function() {
        discard('working-schedule-types.php');
    });
}