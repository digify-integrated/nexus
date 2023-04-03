(function($) {
    'use strict';

    $(function() {
        if($('#departments-datatable').length){
            initialize_department_table('#departments-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_department_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();

    const username = $('#username').text();
    const filter_status = $('#filter_status').val();
    const type = 'departments table';
    var settings;

    const column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'DEPARTMENT_ID' },
        { 'data' : 'DEPARTMENT' },
        { 'data' : 'STATUS' },
        { 'data' : 'MANAGER' },
        { 'data' : 'EMPLOYEES' },
        { 'data' : 'PARENT_DEPARTMENT' },
        { 'data' : 'VIEW' }
    ];

    const column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '10%', 'aTargets': 1 },
        { 'width': '24%', 'aTargets': 2 },
        { 'width': '10%', 'aTargets': 3 },
        { 'width': '15%', 'aTargets': 4 },
        { 'width': '15%', 'aTargets': 5 },
        { 'width': '15%', 'aTargets': 6 },
        { 'width': '10%','bSortable': false, 'aTargets': 7 }
    ];

    const length_menu = show_all ? [[-1], ['All']] : [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'All']];

    settings = {
        'ajax': { 
            'url' : 'system-generation.php',
            'method' : 'POST',
            'dataType': 'JSON',
            'data': {'type' : type, 'username' : username, 'filter_status' : filter_status},
            'dataSrc' : ''
        },
        'order': [[ 1, 'asc' ]],
        'columns' : column,
        'scrollY': false,
        'scrollX': true,
        'scrollCollapse': true,
        'fnDrawCallback': function( oSettings ) {
            readjust_datatable_column();
        },
        'aoColumnDefs': column_definition,
        'lengthMenu': length_menu,
        'language': {
            'emptyTable': 'No data found',
            'searchPlaceholder': 'Search...',
            'search': '',
            'loadingRecords': '<div class="spinner-border spinner-border-lg text-info" role="status"><span class="sr-only">Loading...</span></div>'
        }
    };

    if (buttons) {
        settings.dom = "<'row'<'col-sm-3'l><'col-sm-6 text-center mb-2'B><'col-sm-3'f>>" +  "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7'p>>";
        settings.buttons = ['csv', 'excel', 'pdf'];
    }

    destroy_datatable(datatable_name);

    $(datatable_name).dataTable(settings);
}

function initialize_click_events(){
    const username = $('#username').text();

    $(document).on('click','#delete-department',function() {
        let department_id = [];
        const transaction = 'delete multiple department';

        $('.datatable-checkbox-children').each((index, element) => {
            if ($(element).is(':checked')) {
                department_id.push(element.value);  
            }
        });

        if(department_id.length > 0){
            Swal.fire({
                title: 'Confirm Multiple Departments Deletion',
                text: 'Are you sure you want to delete these departments?',
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
                        data: {username : username, department_id : department_id, transaction : transaction},
                        success: function (response) {
                            switch (response) {
                                case 'Deleted':
                                case 'Not Found':
                                    show_toastr('Multiple Departments Deleted', 'The selected departments have been deleted successfully.', 'success');
                                    reload_datatable('#departments-datatable');
                                    break;
                                case 'Inactive User':
                                    window.location = '404.php';
                                    break;
                                default:
                                    show_toastr('Multiple Departments Deletion Error', response, 'error');
                            }
                        },
                        complete: function(){
                            $('.multiple').addClass('d-none');
                            $('.multiple-action').addClass('d-none');
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_toastr('Multiple Departments Deletion Error', 'Please select the departments you wish to delete.', 'error');
        }
    });

    $(document).on('click','#unarchive-department',function() {
        let department_id = [];
        const transaction = 'unarchive multiple department';

        $('.datatable-checkbox-children').each((index, element) => {
            if ($(element).is(':checked')) {
                department_id.push(element.value);  
            }
        });

        if(department_id.length > 0){
            Swal.fire({
                title: 'Confirm Multiple Departments Unarchive',
                text: 'Are you sure you want to unarchive these departments?',
                icon: 'info',
                showCancelButton: !0,
                confirmButtonText: 'Unarchive',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-success mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, department_id : department_id, transaction : transaction},
                        success: function (response) {
                            switch (response) {
                                case 'Unarchived':
                                case 'Not Found':
                                    show_toastr('Multiple Departments Unarchived', 'The selected departments have been unarchived successfully.', 'success');
                                    reload_datatable('#departments-datatable');
                                    break;
                                case 'Inactive User':
                                    window.location = '404.php';
                                    break;
                                default:
                                    show_toastr('Multiple Departments Unarchive Error', response, 'error');
                            }
                        },
                        complete: function(){
                            $('.multiple').addClass('d-none');
                            $('.multiple-action').addClass('d-none');
                        }
                    });
                    return false;
                }
            });
        }
        else{
            show_toastr('Multiple Departments Unarchive Error', 'Please select the departments you wish to unarchive.', 'error');
        }
    });

    $(document).on('click','#archive-department',function() {
        let department_id = [];
        const transaction = 'archive multiple department';

        $('.datatable-checkbox-children').each((index, element) => {
            if ($(element).is(':checked')) {
                department_id.push(element.value);  
            }
        });

        if(department_id.length > 0){
            Swal.fire({
                title: 'Confirm Multiple Departments Archive',
                text: 'Are you sure you want to archive these departments?',
                icon: 'warning',
                showCancelButton: !0,
                confirmButtonText: 'Archive',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-danger mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, department_id : department_id, transaction : transaction},
                        success: function (response) {
                            switch (response) {
                                case 'Archived':
                                case 'Not Found':
                                    show_toastr('Multiple Departments Archived', 'The selected departments have been archived successfully.', 'success');
                                    reload_datatable('#departments-datatable');
                                    break;
                                case 'Inactive User':
                                    window.location = '404.php';
                                    break;
                                default:
                                    show_toastr('Multiple Departments Archive Error', response, 'error');
                            }
                        },
                        complete: function(){
                            $('.multiple').addClass('d-none');
                            $('.multiple-action').addClass('d-none');
                        }
                    });
                    return false;
                }
            });
        }
        else{
            show_toastr('Multiple Departments Archive Error', 'Please select the departments you wish to archive.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_department_table('#departments-datatable');
    });
}