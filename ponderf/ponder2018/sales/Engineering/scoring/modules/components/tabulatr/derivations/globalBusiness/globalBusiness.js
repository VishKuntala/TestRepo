import $ from "jquery";
import * as R from 'ramda';





const globalBusinessTable = ({ adminUser, instance }) => {


    const attachEventHandlers = async () => {
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
        frozenDataKeys : ['rownum', 'industry', 'svid', 'company_name'],
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
            footerElement: `<button id="btnExportAll" class="ui blue mini left floated button">Export All</button>
                            <button id="btnExportTopLocations"  class="ui blue mini left floated button">Export Top ${instance.store.config.tableRecordsLimit}</button>`
                                    
        }
    }
}

export default globalBusinessTable;

