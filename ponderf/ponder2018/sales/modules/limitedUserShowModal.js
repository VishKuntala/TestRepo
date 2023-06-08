//helper function to show  data for limited users on the modal using  div ID="limitedUserDiv" and table ID="showDataModal_MDUtable_limitedUser"
const showLimitedUserData = (data) => {
    console.log('showDataModal_MDUtable_limitedUser');
    $('#showDataModal_MDUtable_limitedUser').dataTable().fnDestroy(); //destroy old table

    $('#LOADING_showData_Modal').hide();
    $('#showDataModalTableDiv').show();
    $('#commonDiv').hide();
    $('#limitedUserDiv').show();
    groupByFilter();

    var table = $('#showDataModal_MDUtable_limitedUser');
    
    table.DataTable({
        //responsive: true,
        data: data,
        paging: false,
        //deferRender: true,
        scrollY: '500px',
        scrollCollapse: true,
        scrollX: true,
        //scroller: true,
        sort: false,
        //order: [[4, "desc"]],
        dom: 'frtip',
        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
        columns: [
            { 'data': 'HOUSE_NUMBER' },
            { 'data': 'PREFIX' },
            { 'data': 'STREET_NAME' },
            { 'data': 'UNIT_NUMBER' },
            { 'data': 'CITY' },
            { 'data': 'STATE' },
            { 'data': 'ZIP' },
            { 'data': 'HYPERGIG' },
            { 'data': 'REGREEN' },
            { 'data': 'ADSL' },
            { 'data': 'CSI_ELIGIBLE' },
            { 'data': 'WIRELESS_SCORE' },
            { 'data': 'SERVICE_STATUS' },
            { 'data': 'DWELLING_TYPE' }
        ],

        initComplete: function () {
            this.api().columns().every(function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                    .appendTo($(column.footer()).empty())
                    .on('change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );

                        column
                            .search(val ? '^' + val + '$' : '', true, false)
                            .draw();
                    });

                column.data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });
            this.api().columns().header().each(function (th) {
                $(th).removeClass("sorting_asc");
                $(th).removeClass("sorting");
            });
        },
    });

}

export { showLimitedUserData };
