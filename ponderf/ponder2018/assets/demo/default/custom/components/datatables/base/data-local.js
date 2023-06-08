//== Class definition

var DatatableDataLocalDemo = function () {
    //== Private functions

    // demo initializer
    var demo = function () {

        var dataJSONArray = JSON.parse('[{"RecordID": 1, "Market": "Central Region", "Program": "LTE AC", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 1, "Market": "MNP", "Program": "LTE AC", "Forecast": "50",  "SAQComplete": "8", "ConstructionStarted": "6", "TowerWorkComplete": "1", "OnAir": "1" ,"Status": 7 },{"RecordID": 3, "Market": "ILWI", "Program": "LTE AC", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 6 },{"RecordID": 4, "Market": "GMW", "Program": "LTE AC", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 5 },{"RecordID": 5, "Market": "AROK", "Program": "LTE AC", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 4 },{"RecordID": 6, "Market": "NTX", "Program": "LTE AC", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 3 },{"RecordID": 7, "Market": "STX", "Program": "LTE AC", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 2 },{"RecordID": 8, "Market": "Central Region", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 9, "Market": "MNP", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 1 },{"RecordID": 10, "Market": "ILWI", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 11, "Market": "GMW", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 6 },{"RecordID": 12, "Market": "AROK", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 13, "Market": "NTX", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 5 },{"RecordID": 14, "Market": "STX", "Program": "NSB", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 4 },{"RecordID": 15, "Market": "Central Region", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 16, "Market": "MNP", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 17, "Market": "ILWI", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 18, "Market": "GMW", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 19, "Market": "AROK", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 20, "Market": "NTX", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 21, "Market": "STX", "Program": "C-RAN", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 7 },{"RecordID": 22, "Market": "Central Region", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 1 },{"RecordID": 23, "Market": "MNP", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 1 },{"RecordID": 24, "Market": "ILWI", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 1 },{"RecordID": 25, "Market": "GMW", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 3 },{"RecordID": 26, "Market": "AROK", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 5 },{"RecordID": 27, "Market": "NTX", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 5 },{"RecordID": 28, "Market": "STX", "Program": "LTE 1C", "Forecast": "100", "SAQComplete": "10", "ConstructionStarted": "8", "TowerWorkComplete": "2", "OnAir": "1", "Status": 4 }]');

        var datatable = $('.m_datatable').mDatatable({
            // datasource definition
            data: {
                type: 'local',
                source: dataJSONArray,
                pageSize: 10                 
            },

            // layout definition
            layout: {
                theme: 'default', // datatable theme
                class: '', // custom wrapper class
                scroll: false, // enable/disable datatable scroll both horizontal and vertical when needed.
                //height: 150, // datatable's body's fixed height
                footer: false // display/hide footer
            },

            // column sorting
            sortable: true,

            pagination: true,

            search: {
                input: $('#generalSearch')
            },

            // inline and batch editing(cooming soon)
            // editable: false,

            // columns definition
            columns: [{
                field: "RecordID",
                title: "#",
                width: 50,
                sortable: false,
                textAlign: 'center',
                selector: { class: 'm-checkbox--solid m-checkbox--brand' }
            }, {
                field: "Market",
                title: "Market"
            }, {
                field: "Program",
                title: "Program",
                responsive: { visible: 'lg' }
            }, {
                field: "Forecast",
                title: "Forecast",
                type: "number",
                textAlign: 'center'
            }, {
                field: "SAQComplete",
                title: "SAQ Complete",
                type: "number",
                textAlign: 'center'
            }, {
                field: "ConstructionStarted",
                title: "Construction Started",
                type: "number",
                textAlign: 'center'
            }, {
                field: "TowerWorkComplete",
                title: "Tower Work Complete",
                type: "number",
                textAlign: 'center'
            }, {
                field: "OnAir",
                title: "On Air",
                type: "number",
                textAlign: 'center'
            }, {
                field: "Status",
                title: "Status",
                // callback function support for column rendering
                template: function (row) {
                    var status = {
                        1: { 'title': 'Pending', 'class': 'm-badge--brand' },
                        2: { 'title': 'Delivered', 'class': ' m-badge--metal' },
                        3: { 'title': 'Canceled', 'class': ' m-badge--primary' },
                        4: { 'title': 'On Target', 'class': ' m-badge--success' },
                        5: { 'title': 'Info', 'class': ' m-badge--info' },
                        6: { 'title': 'Danger', 'class': ' m-badge--danger' },
                        7: { 'title': 'Warning', 'class': ' m-badge--warning' }
                    };
                    return '<span class="m-badge ' + status[row.Status].class + ' m-badge--wide">' + status[row.Status].title + '</span>';
                }
            }]
        });

        var query = datatable.getDataSourceQuery();

        $('#m_form_status').on('change', function () {
            datatable.search($(this).val(), 'Market');
        }).val(typeof query.market !== 'undefined' ? query.market : '');

        $('#m_form_type').on('change', function () {
            datatable.search($(this).val(), 'Program');
        }).val(typeof query.type !== 'undefined' ? query.type : '');

        $('#m_form_status, #m_form_type').selectpicker();

    };

    return {
        //== Public functions
        init: function () {
            // init demo
            demo();
        }
    };
}();

jQuery(document).ready(function () {
    DatatableDataLocalDemo.init();
});