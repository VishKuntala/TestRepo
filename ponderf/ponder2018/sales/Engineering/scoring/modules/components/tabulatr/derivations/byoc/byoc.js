import $ from "jquery";
import * as R from 'ramda';





const byocTable = ({ adminUser, instance }) => {

    const attachEventHandlers = async () => {
        $('#btnSalesExportAll')
            .off().on('click', function () {
                // trigger exportMapData event
                instance.store.exportSalesData = `${Date.now().toString()}`;
            });

        $('#btnExportAll')
            .off().on('click', function () {
                // trigger exportMapData event
                instance.store.exportMapData = `${Date.now().toString()}`;
            });

        $('#btnExportTopLocations')
            .off().on('click', async function () {
                await instance.exportTableData();
            });
    }

    return {
        attachEventHandlers,
        frozenDataKeys: ['rownum', 'location_id', 'company_name', 'address', 'city', 'state', 'zipcode'],
        dataTableConfig: {
            tableBuilt: function () {
                if (instance.store.mapDataLength > instance.store.config.tableRecordsLimit) {
                    $(".tabulator-footer #btnExportTopLocations").show();
                } else {
                    $(".tabulator-footer #btnExportTopLocations").hide();
                }

            },
            headerHozAlign: "center",
            pagination: "local",
            paginationSize: 5,
            rowClick: function (e, row) {
                const data = row.getData();
                // we add the currentdatetimestring to trigger the publish of the zoomToPoint event
                instance.store.zoomToPoint = [data.latitude, data.longitude, Date.now().toString()];
            },
            footerElement: `<button id="btnExportAll" class="ui red mini left floated button">ACE Internal Only Export All</button>
                            <button id="btnExportTopLocations"  class="ui red mini left floated button">ACE Internal Only Export Top ${instance.store.config.tableRecordsLimit}</button>
                            <button id="btnSalesExportAll" class="ui blue mini left floated button">Sales Export All</button>`

        }
    }
}

export default byocTable;

