(function($) {
    'use strict';

    $(function() {
        initializeMenuGroupForm();

        if($('#menu-group-id').length){
            displayDetails('menu groups details');

            if($('#menu-item-table').length){
                initializeMenuItemTable('#menu-item-table');
            }

            if($('#menu-item-modal').length){
                initializeMenuItemForm();
            }
        }
        
        $(document).on('click','#discard-create',function() {
            discardCreate('menu-groups.php');
        });

        $(document).on('click','#edit-form',function() {            
            displayDetails('menu groups details');
        });

        $(document).on('click','#delete-menu-group',function() {
            const email_account = $('#email_account').text();
            const menu_group_id = $(this).data('menu-group-id');
            const transaction = 'delete menu group';
    
            Swal.fire({
                title: 'Confirm Menu Group Deletion',
                text: 'Are you sure you want to delete this menu group?',
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
                        data: {email_account : email_account, menu_group_id : menu_group_id, transaction : transaction},
                        success: function (response) {
                            switch (response) {
                                case 'Deleted':
                                    setNotification('Menu Group Deleted', 'The menu group has been deleted successfully.', 'success');
                                    window.location = 'menu-groups.php';
                                    break;
                                case 'Not Found':
                                    setNotification('Menu Group Deletion Error', 'The menu group does not exist.', 'danger');
                                    window.location = '404.php';
                                    break;
                                case 'Inactive User':
                                case 'User Not Found':
                                    window.location = 'logout.php?logout';
                                    break;
                                default:
                                    show_toastr('Menu Group Deletion Error', response, 'danger');
                                    break;
                            }
                        }
                    });
                    return false;
                }
            });
        });

        $(document).on('click','#duplicate-menu-group',function() {
            const email_account = $('#email_account').text();
            const menu_group_id = $(this).data('menu-group-id');
            const transaction = 'duplicate menu group';
    
            Swal.fire({
                title: 'Confirm Menu Group Duplication',
                text: 'Are you sure you want to duplicate this menu group?',
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
                        data: {email_account : email_account, menu_group_id : menu_group_id, transaction : transaction},
                        dataType: 'JSON',
                        success: function (response) {
                            switch (response[0]['RESPONSE']) {
                                case 'Duplicated':
                                    setNotification('Duplicate Menu Group Success', 'The menu group has been duplicated successfully.', 'success');
                                    window.location = 'menu-group-form.php?id=' + response[0]['MENU_GROUP_ID'];
                                    break;
                                case 'Not Found':
                                    setNotification('Duplicate Menu Group Error', 'The source menu group does not exist.', 'danger');
                                    window.location = '404.php';
                                    break;
                                case 'Inactive User':
                                case 'User Not Found':
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

        $(document).on('click','#create-menu-item',function() {
            $('#menu-item-modal').modal('show');

            resetModalForm();
        });
    });
})(jQuery);

function initializeMenuItemTable(datatable_name, buttons = false, show_all = false){
    const menu_group_id = $('#menu-group-id').text();
    const email_account = $('#email_account').text();
    const type = 'menu item table';
    var settings;

    const column = [ 
        { 'data' : 'MENU_ITEM_ID' },
        { 'data' : 'MENU_ITEM_NAME' },
        { 'data' : 'ORDER_SEQUENCE' },
        { 'data' : 'ACTION' }
    ];

    const column_definition = [
        { 'width': '10%', 'aTargets': 0 },
        { 'width': '65%', 'aTargets': 1 },
        { 'width': '15%', 'aTargets': 2 },
        { 'width': '10%','bSortable': false, 'aTargets': 3 }
    ];

    const length_menu = show_all ? [[-1], ['All']] : [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'All']];

    settings = {
        'ajax': { 
            'url' : 'system-generation.php',
            'method' : 'POST',
            'dataType': 'JSON',
            'data': {'type' : type, 'email_account' : email_account, 'menu_group_id' : menu_group_id},
            'dataSrc' : ''
        },
        'order': [[ 0, 'asc' ]],
        'columns' : column,
        'columnDefs': column_definition,
        'lengthMenu': length_menu,
        'language': {
            'emptyTable': 'No data found',
            'searchPlaceholder': 'Search...',
            'search': '',
            'loadingRecords': 'Just a moment while we fetch your data...'
        }
    };

    if (buttons) {
        settings.dom = "<'row'<'col-sm-3'l><'col-sm-6 text-center mb-2'B><'col-sm-3'f>>" +  "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7'p>>";
        settings.buttons = ['csv', 'excel', 'pdf'];
    }

    destroyDatatable(datatable_name);

    $(datatable_name).dataTable(settings);
}

function initializeMenuGroupForm(){
    const bouncer = new Bouncer('#menu-group-form', {
        disableSubmit: true,
        customValidEventName: 'menuGroupFormValid'
    });
      
    document.addEventListener('bouncerFormInvalid', function (event) {
        window.scrollTo(0, event.detail.errors[0].offsetTop);
    }, false);
      
    document.addEventListener('menuGroupFormValid', function () {
        alert();
        const email_account = $('#email_account').text();
        const form = document.querySelector('#menu-group-form');
        const transaction = 'submit menu group';
      
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
                        setNotification('Insert Menu Group Success', 'The menu group has been inserted successfully.', 'success');
                        window.location = window.location.href + '?id=' + response[0]['MENU_GROUP_ID'];
                        break;
                    case 'Updated':
                        setNotification('Update Menu Group Success', 'The menu group has been updated successfully.', 'success');
                        window.location.reload();
                        break;
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
    }, false);
}

function initializeMenuItemForm(){
    const bouncer = new Bouncer('#menu-item-form', {
        disableSubmit: true,
        customValidEventName: 'menuItemFormValid'
    });
      
    document.addEventListener('bouncerFormInvalid', function (event) {
        window.scrollTo(0, event.detail.errors[0].offsetTop);
    }, false);
      
    document.addEventListener('menuItemFormValid', function () {
        const email_account = $('#email_account').text();
        const menu_group_id = $('#menu-group-id').text();
        const form = document.querySelector('#menu-item-form');
        const transaction = 'submit menu item';
      
        $.ajax({
            type: 'POST',
            url: 'controller.php',
            data: $(form).serialize() + '&email_account=' + email_account + '&menu_group_id=' + menu_group_id + '&transaction=' + transaction,
            beforeSend: function() {
                disableFormSubmitButton('submit-data');
            },
            success: function (response) {
                switch (response) {
                    case 'Inserted':
                        showNotification('Insert Menu Item Success', 'The menu item has been inserted successfully.', 'success');
                        reloadDatatable('#menu-item-table');
                        break;
                    case 'Updated':
                        showNotification('Update Menu Item Success', 'The menu item has been updated successfully.', 'success');
                        reloadDatatable('#menu-item-table');
                        break;
                    case 'Inactive User':
                        window.location = 'logout.php?logout';
                        break;
                    default:
                        showNotification('Transaction Error', response, 'danger');
                        break;
                }
            },
            complete: function() {
                enableFormSubmitButton('submit-data', 'Save');
            }
        });
    }, false);
}