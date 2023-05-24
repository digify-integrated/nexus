(function($) {
    'use strict';

    $(function() {
        const email_account = $('#email_account').text();

        if($('#upload-settings-table').length){
            initialized_upload_settings_table('#upload-settings-table');
        }

        $(document).on('click','.delete-upload-setting',function() {
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
                                    showNotification('Delete Upload Setting Success', 'The upload setting has been deleted successfully.', 'success');
                                    reloadDatatable('#upload-settings-table');
                                    break;
                                case 'Not Found':
                                    showNotification('Delete Upload Setting Error', 'The upload setting does not exist.', 'danger');
                                    reloadDatatable('#upload-settings-table');
                                    break;
                                case 'Inactive User':
                                case 'User Not Found':
                                    window.location = 'logout.php?logout';
                                    break;
                                default:
                                    showNotification('Delete Upload Setting Error', response, 'danger');
                                    break;
                            }
                        }
                    });
                    return false;
                }
            });
        });

        $(document).on('click','#delete-upload-setting',function() {
            let upload_setting_id = [];
            const transaction = 'delete multiple upload setting';

            $('.datatable-checkbox-children[data-delete="1"]').each((index, element) => {
                if ($(element).is(':checked')) {
                    upload_setting_id.push(element.value);
                }
            });
    
            if(upload_setting_id.length > 0){
                Swal.fire({
                    title: 'Confirm Multiple Upload Settings Deletion',
                    text: 'Are you sure you want to delete these upload settings?',
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
                                        showNotification('Delete Upload Setting Success', 'The selected upload settings have been deleted successfully.', 'success');
                                        reloadDatatable('#upload-settings-table');
                                        break;
                                    case 'User Not Found':
                                    case 'Inactive User':
                                        window.location = 'logout.php?logout';
                                        break;
                                    default:
                                        showNotification('Upload Setting Deletion Error', response, 'danger');
                                        break;
                                }
                            },
                            complete: function(){
                                toggleHideActionDropdown();
                            }
                        });
                        
                        return false;
                    }
                });
            }
            else{
                showNotification('Deletion Multiple Upload Setting Error', 'Please select the upload settings you wish to delete.', 'danger');
            }
        });
    });
})(jQuery);

function initialized_upload_settings_table(datatable_name, buttons = false, show_all = false){
    toggleHideActionDropdown();

    const email_account = $('#email_account').text();
    const type = 'upload settings table';
    var settings;

    const column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'UPLOAD_SETTING_ID' },
        { 'data' : 'UPLOAD_SETTING_NAME' },
        { 'data' : 'MAX_UPLOAD_SIZE' },
        { 'data' : 'ALLOWED_FILE_EXTENSION' },
        { 'data' : 'ACTION' }
    ];

    const column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '10%', 'aTargets': 1 },
        { 'width': '49%', 'aTargets': 2 },
        { 'width': '10%', 'aTargets': 3 },
        { 'width': '20%', 'aTargets': 4 },
        { 'width': '10%','bSortable': false, 'aTargets': 5 }
    ];

    const length_menu = show_all ? [[-1], ['All']] : [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'All']];

    settings = {
        'ajax': { 
            'url' : 'system-generation.php',
            'method' : 'POST',
            'dataType': 'JSON',
            'data': {'type' : type, 'email_account' : email_account},
            'dataSrc' : ''
        },
        'order': [[ 1, 'asc' ]],
        'columns' : column,
        'scrollY': false,
        'scrollX': true,
        'scrollCollapse': true,
        'fnDrawCallback': function( oSettings ) {
            readjustDatatableColumn();
        },
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
