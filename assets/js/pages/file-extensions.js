(function($) {
    'use strict';

    $(function() {
        const email_account = $('#email_account').text();

        if($('#file-extensions-table').length){
            initialized_file_extensions_table('#file-extensions-table');
        }

        $(document).on('click','.delete-file-extension',function() {
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
                                    showNotification('Delete File Extension Success', 'The file extension has been deleted successfully.', 'success');
                                    reloadDatatable('#file-extensions-table');
                                    break;
                                case 'Not Found':
                                    showNotification('Delete File Extension Error', 'The file extension does not exist.', 'danger');
                                    reloadDatatable('#file-extensions-table');
                                    break;
                                case 'Inactive User':
                                case 'User Not Found':
                                    window.location = 'logout.php?logout';
                                    break;
                                default:
                                    showNotification('Delete File Extension Error', response, 'danger');
                                    break;
                            }
                        }
                    });
                    return false;
                }
            });
        });

        $(document).on('click','#delete-file-extension',function() {
            let file_extension_id = [];
            const transaction = 'delete multiple file extension';

            $('.datatable-checkbox-children[data-delete="1"]').each((index, element) => {
                if ($(element).is(':checked')) {
                    file_extension_id.push(element.value);
                }
            });
    
            if(file_extension_id.length > 0){
                Swal.fire({
                    title: 'Confirm Multiple File Extensions Deletion',
                    text: 'Are you sure you want to delete these file extensions?',
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
                                        showNotification('Delete File Extension Success', 'The selected file extensions have been deleted successfully.', 'success');
                                        reloadDatatable('#file-extensions-table');
                                        break;
                                    case 'User Not Found':
                                    case 'Inactive User':
                                        window.location = 'logout.php?logout';
                                        break;
                                    default:
                                        showNotification('File Extension Deletion Error', response, 'danger');
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
                showNotification('Deletion Multiple File Extension Error', 'Please select the file extensions you wish to delete.', 'danger');
            }
        });

        $(document).on('click','#apply-filter',function() {
            initialized_file_extensions_table('#file-extensions-table');
        });
    });
})(jQuery);

function initialized_file_extensions_table(datatable_name, buttons = false, show_all = false){
    toggleHideActionDropdown();

    const email_account = $('#email_account').text();
    const filter_file_type_id = $('#filter_file_type_id').val();
    const type = 'file extension table';
    var settings;

    const column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'FILE_EXTENSION_ID' },
        { 'data' : 'FILE_EXTENSION_NAME' },
        { 'data' : 'FILE_TYPE_NAME' },
        { 'data' : 'ACTION' }
    ];

    const column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '10%', 'aTargets': 1 },
        { 'width': '40%', 'aTargets': 2 },
        { 'width': '39%', 'aTargets': 3 },
        { 'width': '10%','bSortable': false, 'aTargets': 4 }
    ];

    const length_menu = show_all ? [[-1], ['All']] : [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'All']];

    settings = {
        'ajax': { 
            'url' : 'system-generation.php',
            'method' : 'POST',
            'dataType': 'JSON',
            'data': {'type' : type, 'email_account' : email_account, 'filter_file_type_id' : filter_file_type_id},
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