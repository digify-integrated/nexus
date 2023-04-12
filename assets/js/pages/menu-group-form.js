(function($) {
    'use strict';

    $(function() {
        if($('#menu-group-id').length){
            //display_details('menu group details');

            if($('#menu-item-table').length){
                initialize_menu_item_table('#menu-item-table');
            }
        }
        
        $(document).on('click','#discard-create',function() {
            discardCreate('menu-groups.php');
        });
    });
})(jQuery);

function initialize_menu_item_table(datatable_name, buttons = false, show_all = false){    
    const menu_group_id = $('#menu-group-id').text();
    const email_account = $('#email_account').text();
    const type = 'menu item table';
    var settings;

    const column = [ 
        { 'data' : 'MENU_ID' },
        { 'data' : 'MENU_NAME' },
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