import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";
import { config } from "../config/config.js";
import { config as mapconfig } from "../../../../azureMap/derivations/mainMap/config/config.js";





const neonGigapowerTable = ({ adminUser, instance }) => {


    const updateTable = async d => {
        const tableConfiguration = config.tables.neonGigapower;
        const {
            dataKeys,
            headers,
            frozenDataKeys,
            hiddenColumns,
            footerElement,
            dataTableExportOmitKeys,
        } = tableConfiguration;
        instance.derivedClass.dataKeys = dataKeys;
        instance.derivedClass.headers = headers;
        instance.derivedClass.frozenDataKeys = frozenDataKeys;
        instance.derivedClass.hiddenColumns = hiddenColumns;
        instance.derivedClass.dataTableConfig.footerElement = footerElement(instance.isExportAllowed());
        instance.derivedClass.dataTableExportOmitKeys = dataTableExportOmitKeys;
        await instance.renderTable();
        // trigger chart rendering
        instance.store.renderChart = buildPayloadFromStore(instance);

    }

    const filterTable = async () => {
        const tableConfiguration = config.tables.neonGigapower;
        const searchText = R.trim($("#txtTableSearch").val().toLowerCase());
        if (searchText === '') {
            instance.table.clearFilter();
        } else {
            instance.table.setFilter(tableConfiguration.tableFilters ? tableConfiguration.tableFilters(searchText) : []);
        }
    }

    const initSubscriptions = async () => {

    };


    const getAjaxParams = () => {
        return Object.assign(buildPayloadFromStore(instance),
            { buildSortColumns: true }
        );
    }

    const getAjaxUrl = () => `${instance.store.config.baseUrl}/table`;

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
        sortingDisabled: true,
        frozenDataKeys: config.tables.neonGigapower.frozenDataKeys,
        hiddenColumns: config.tables.neonGigapower.hiddenColumns,
        dataKeys: config.tables.neonGigapower.dataKeys,
        headers: config.tables.neonGigapower.headers,
        prependColumns: [{
            title: 'Zoom Map',
            formatter: function (cell, formatterParams, onRendered) {
                return `<button class="blue ui mini icon button">
                            <i data-publish-attr="zoomToPoint" class="map marker alternate icon"></i>
                       </button>`
            },
            width: 60,
            headerSort: false,
            align: "center", cellClick: async (e, cell) => {
                const rowData = cell.getRow().getData();
                const { data } = await instance.getData(
                    `${instance.store.config.baseUrl}/psa/${rowData.zip_co_psa}`,
                );
                instance.store.psaPopupOpened = true;
                instance.store.zoomToPoint = Object.assign(data[0], {
                    dataType: 'psa',
                    zoom: mapconfig.pointsLayers.PSA_POINTS.maxZoom -1,
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });
            }
        },{
            title: 'SIP Rivals Info',
            formatter: function (cell, formatterParams, onRendered) {
                return `<button class="blue ui mini icon button">
                            <i data-publish-attr="zoomToPoint" class="binoculars alternate icon"></i>
                       </button>`
            },
            width: 60,
            headerSort: false,
            align: "center", cellClick: async (e, cell) => {
                let dlSpeedHtml = '';
                const rowData = cell.getRow().getData();
                const { data } = await instance.getData(
                    `${instance.store.config.baseUrl}/rivals/${rowData.zip}`,
                );
                // const rivalsData = data[0];
                if (data) {
                    const dlSpeedInfo = R.take(data.length - 1, data);
                    const tmobileHotspotInfo = R.takeLast(1, data);
                    const dlSpeedTableHeaders =R.join('', R.map(item => `<th>${R.toUpper(item)}</th>`, R.keys(data[0])));
                    const dlSpeedTableBody = R.join('', R.map(item => `<tr>${R.join('', R.map(cell => `<td>${cell}</td>`, R.values(item)))}</tr>`, dlSpeedInfo));
                    $(".rivalsInfoZip").html(rowData.zip);
                    $('#dlSpeed').html(`<thead>
                                            <tr>${dlSpeedTableHeaders}</tr>
                                        </thead>
                                        <tbody>
                                            ${dlSpeedTableBody}
                                        </tbody>
                                        `);
                    const tmobileHotspotTableHeaders =R.join('', R.map(item => `<th>${R.toUpper(item)}</th>`, R.keys(data[0])));
                    const tmobileHotspotTableBody = tmobileHotspotInfo ? R.join('', R.map(item => `<tr>${R.join('', R.map(cell => `<td>${cell}</td>`, R.values(item)))}</tr>`, tmobileHotspotInfo)) : '';
                    $('#tmobilehotspot').html(`<thead>
                                            <tr>${tmobileHotspotTableHeaders}</tr>
                                        </thead>
                                        <tbody>
                                            ${tmobileHotspotTableBody}
                                        </tbody>
                                        `);
                                        
                }
                
                $('.rivals.modal').modal({
                    closable: false,
                    onShow: async function () {
                       /* $('#psaInfo').html(`<div class="ui grid">
                            <div class="two wide column"><b>Sales Market:</b></div>
                            <div class="two wide column">${rowData.sales_market}</div>
                            <div class="two wide column"><b>DMA:</b></div>
                            <div class="two wide column">${rowData.dma_name}</div>
                            <div class="two wide column"><b>PSA:</b></div>
                            <div class="two wide column">${rowData.zip_co_psa}</div>
                            <div class="two wide column"><b>State:</b></div>
                            <div class="two wide column">${rowData.state}</div>
                            <div class="two wide column"><b>Zip:</b></div>
                            <div class="two wide column">${rowData.zip}</div>
                            <div class="two wide column"><b>Fiber Available:</b></div>
                            <div class="two wide column">${rowData.fiber_available}</div>
                            <div class="two wide column"><b>Fiber Customers:</b></div>
                            <div class="two wide column">${rowData.wireless_customers}</div>
                            <div class="two wide column"><b>Fiber Pen Rate:</b></div>
                            <div class="two wide column">${rowData.fiber_percentage}</div>
                            <div class="two wide column"><b>Wireless Customers:</b></div>
                            <div class="two wide column">${rowData.wireless_customers}</div>
                            <div class="two wide column"><b>Wireless Pen Rate:</b></div>
                            <div class="two wide column">${rowData.wireless_percentage}</div>
                            <div class="two wide column"><b>Fiber Opportunities:</b></div>
                            <div class="two wide column">${rowData.fiber_opportunity}</div>
                            <div class="two wide column"><b>Fiber and Wireless Customer:</b></div>
                            <div class="two wide column">${rowData.fiber_customer_wireless_customer}</div>
                            <div class="two wide column"><b>Fiber Customers Wireless Cross-Sell:</b></div>
                            <div class="two wide column">${rowData.fiber_customer_no_wireless}</div>
                            <div class="two wide column"><b>Wireless Customers Fiber Cross-Sell:</b></div>
                            <div class="two wide column">${rowData.wireless_customer_no_fiber}</div>
                            <div class="two wide column"><b>Fiber and Wireless Opportunities:</b></div>
                            <div class="two wide column">${rowData.no_fiber_no_wireless}</div>
                        </div>`); */
                      $('#psaInfo').html(`<h4>PSA: ${rowData.zip_co_psa}</h4>
                       <b>Sales Market:</b> ${rowData.sales_market}
                       <br/><b>DMA:</b> ${rowData.dma_name}
                       <br/><b>State:</b> ${rowData.state}
                       <br/><b>Zip:</b> ${rowData.zip}
                       <br/><b>Fiber Available:</b> ${new Intl.NumberFormat().format(rowData.fiber_available)}
                       <br/><b>Fiber Customers:</b> ${new Intl.NumberFormat().format(rowData.fiber_percentage)}
                       <br/><b>Fiber Opportunities:</b> ${new Intl.NumberFormat().format(rowData.fiber_opportunity)}
                       <br/><b>Wireless Customers:</b> ${new Intl.NumberFormat().format(rowData.wireless_percentage)}`);
                        return true;
                    },
                    onApprove: async function () {
                        $('.rivals.modal').modal('close');
                    }
                }).modal('setting', 'transition', 'fade up')
                    .modal('show');
                /* instance.store.psaPopupOpened = true;
                instance.store.zoomToPoint = Object.assign(data[0], {
                    dataType: 'psa',
                    zoom: mapconfig.pointsLayers.PSA_POINTS.maxZoom -1,
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                }); */
            }
        }],
        dataTableConfig: {
            ajaxURLGenerator: function (url, config, params) {
                //url - the url from the ajaxURL property or setData function
                //config - the request config object from the ajaxConfig property
                //params - the params object from the ajaxParams property, this will also include any pagination, filter and sorting properties based on table setup
                //return request url
                return url;
            },
            ajaxResponse: function (url, params, response) {
                if (response.locationCount) {
                    $("#mainTableTab").html(`<i class=${instance.store.config.tabs?.[0]?.icon || "building icon"}></i>${instance.store.config.tabs?.[0]?.label || 'Building Locations'} (${new Intl.NumberFormat().format(response.businessCount < 5000 ? response.businessCount : 5000 )})`);
                    $("#addlInfo1").html(`<div>Total ${instance.store.config.tabs?.[0]?.label || 'Building Locations'} (as filtered): ${new Intl.NumberFormat().format(response.businessCount)}</div>`);
                    $("#addlInfo2").html(`<div>Total ${instance.store.config.tabs?.[1]?.label || 'Business Tenants'} (as filtered): ${new Intl.NumberFormat().format(response.locationCount)}</div>`);
                }
                return response;
            },
            headerHozAlign: "center",
            pagination: config.tables.neonGigapower.pagination,
            paginationSize: 12,
            ajaxContentType: "json",
            ajaxSorting: true,
            ajaxFiltering: true,
            ajaxConfig: {
                method: "post",
                headers: {
                    Authorization: $("#hdnToken").val(),
                }
            },
            paginationDataSent: {
                "page": "offset",
                "size": "limit"
            },
            footerElement: config.tables.natLus.footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
        updateTable,
        filterTable,
    };

}

export default neonGigapowerTable;

