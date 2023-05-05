(function($) {
    'use strict';

    $(function() {
        initializeMenuItemForm();

        if($('#menu-item-id').length){
            displayDetails('menu item details');
        }

        $(document).on('click','#discard-create',function() {
            discardCreate('menu-items.php');
        });

        $(document).on('click','#edit-form',function() {
            displayDetails('menu item details');
        });
    });
})(jQuery);

function initializeMenuItemForm(){
    $('#menu-item-form').validate({
        rules: {
            menu_item: {
                required: true
            },
            menu_group_id: {
                required: true
            },
            menu_item_order_sequence: {
                required: true
            }
        },
        messages: {
            menu_item: {
                required: 'Please enter the menu item'
            },
            menu_group_id: {
                required: 'Please choose the menu group'
            },
            menu_item_order_sequence: {
                required: 'Please enter the order sequence'
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
            const transaction = 'submit menu item';
          
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
                            setNotification('Insert Menu Item Success', 'The menu item has been inserted successfully.', 'success');
                            window.location = window.location.href + '?id=' + response[0]['MENU_ITEM_ID'];
                            break;
                        case 'Updated':
                            setNotification('Update Menu Item Success', 'The menu item has been updated successfully.', 'success');
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