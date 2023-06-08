import $ from "jquery";
import * as R from 'ramda';
import ExcelJS from 'exceljs';
import * as deleteClusterButton from './deleteClusterButton.js';
import * as downloadExcelAndRerunButtons from './downloadExcelAndRerunButtons.js';



const clustersDataTable = ({ adminUser, instance }) => {


    const getClusterDetails = async (clusterId) => {
        const response = await $.ajax({
            url: `/sales/AWB/byoc/BYOC.aspx/ClusterDetails?clusterId=${clusterId}`,
            headers: { "Content-Type": "application/json" },
            type: 'get'
        });
        const clusterDetails = response.d;
        const workbook = new ExcelJS.Workbook();
        const worksheet = workbook.addWorksheet("BYOC Cluster");
        worksheet.columns = [
            { header: 'ADDRESS', key: 'address', width: 25 },
            { header: 'CITY', key: 'city', width: 25 },
            { header: 'STATE', key: 'state', width: 25 },
            { header: 'ZIPCODE', key: 'zipcode', width: 10 },
            { header: 'LATITUDE', key: 'latitude', width: 15 },
            { header: 'LONGITUDE', key: 'longitude', width: 15 },
            { header: 'LOCATION_ID', key: 'location_id', width: 25 },
            { header: 'COMPANY_NAME', key: 'company_name', width: 25 },
            { header: 'NOTES', key: 'notes', width: 25 },
            { header: 'INDOOR_COVERAGE_SCORE', key: 'simple_coverage_score', width: 15 },
            { header: 'FIVEG', key: 'fiveg', width: 15 },
            { header: 'FIVEG_PLUS_MMWAVE', key: 'fiveg_plus_mmwave', width: 15 },
            { header: 'FIVEG_PLUS_CBAND', key: 'fiveg_plus_cband', width: 15 },
            { header: 'BAND_14', key: 'band_14', width: 15 },
            { header: 'FIRST_NET', key: 'first_net', width: 15 },
            { header: 'SALES_HIGH_SPEED_SUITABILITY', key: 'sales_high_speed_suitability', width: 25 },
            { header: 'MOBILE_SPEED_EXPERIENCE', key: 'speed_experience', width: 25 },
            { header: 'AZIMUTH', key: 'azimuth', width: 25 },
            { header: 'USID', key: 'usid', width: 25 }
        ];
        worksheet.addRows(clusterDetails);
        const buffer = await workbook.xlsx.writeBuffer();
        const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
        saveAs(blob, "cluster_details.xlsx");
    }

    const rerunCluster = async (clusterId) => {
        $('.ui.rerun.modal')
            .modal({
                closable: false,
                onApprove: async function () {
                    const response = await $.ajax({
                        url: `/sales/AWB/byoc/BYOC.aspx/RerunCluster?clusterId=${clusterId}`,
                        headers: { "Content-Type": "application/json" },
                        type: 'post',
                        data: JSON.stringify({ clusterId }),
                        processData: false
                    });
                    instance.tableData = response.d;
                    await instance.filterTableData();
                    $('.ui.rerun.modal')
                        .modal('close');
                }
            }).modal('show');
    }

    const invokeMap = async (clusterId) => {
        let accessType = "all";
        const filterAttribute = $('input[name="clusterFilter"]:checked').attr('data-filter-attr');
        if (filterAttribute === 'MY') {
            accessType='mine';
        } else if (filterAttribute === 'PUBLIC') {
            accessType = 'public';
        } else if (filterAttribute === 'SHARED') {
            accessType = 'shared';
        }
        window.open(`/sales/AWB/scoring/Scoring.aspx?channel=byoc&accessType=${accessType}&clusterId=${clusterId}`, '_blank');

    }

    const deleteCluster = async (clusterId) => {
        $('.ui.delete.modal')
            .modal({
                closable: false,
                onApprove: async function () {
                    const postData = { clusterId };
                    const response = await $.ajax({
                        url: '/sales/AWB/byoc/BYOC.aspx/DeleteCluster',
                        headers: { "Content-Type": "application/json" },
                        type: 'post',
                        data: JSON.stringify(postData),
                        processData: false,
                    });
                    instance.tableData = response.d;
                    await instance.filterTableData();
                    $('.ui.delete.modal')
                        .modal('close');
                }
            }).modal('show');
    };

    const prependColumns = {
        data: null,
        "defaultContent": deleteClusterButton.html({ adminUser, id: instance.id })
    };

    const appendColumns = {
        data: null,
        "defaultContent": downloadExcelAndRerunButtons.html({ adminUser, id: instance.id })
    };

    const initSubscriptions = () => {
        instance.stateManager.subscribe("deleteCluster",
            async d => {
                if (d && R.is(Array, d) ? d.length : true) {
                    await deleteCluster(d);
                }
            });
        instance.stateManager.subscribe("rerunCluster",
            async d => {
                if (d && R.is(Array, d) ? d.length : true) {
                    await rerunCluster(d);
                }
            });
        instance.stateManager.subscribe("invokeMap",
        async d => {
            if (d && R.is(Array, d) ? d.length : true) {
                await invokeMap(d);
            }
        });            
        instance.stateManager.subscribe("getClusterDetails",
            async d => {
                if (d && R.is(Array, d) ? d.length : true) {
                    await getClusterDetails(d);
                }
            });
        instance.stateManager.subscribe("saveCluster",
            async d => {
                await instance.loadRemoteData();
            });
        instance.stateManager.subscribe("clusterData",
            async d => {
                await instance.reloadTableData(d);
            });
        instance.stateManager.subscribe("filterClusterTable",
            async d => {
                if (instance.table && d) {
                    instance.table.clear();
                    instance.table.rows.add(R.filter(d, instance.tableData));
                    instance.table.draw();
                }
            });
        
    }

    return {
        prependColumns: prependColumns || [],
        appendColumns: appendColumns || [],
        initSubscriptions,
        createdCell: function (td, cellData, rowData, row, col) {
            if (!isNaN(cellData)) {
                $(td).addClass('center aligned');
            }
        },
        dataSrc: result => instance.store.filterClusterTable ? R.filter(instance.store.filterClusterTable, result.d) : result.d,
        dataTableConfig: {
            searching: false,
            paging: true,
            pageLength: 6,
            lengthChange: false,
            "createdRow": function (row, data, index) {
                const dataTableRow = $(row);
                const rowButtons = dataTableRow.find('button');
                for (let i = 0; i < rowButtons.length; i += 1) {
                    const rowButton = $(rowButtons[i]);
                    const showCondition = rowButton.attr('data-show-condition') ? JSON.parse(rowButton.attr('data-show-condition')) : null;
                    if (showCondition) {
                        if (R.whereEq(showCondition, data)) {
                            rowButton.show();
                        } else {
                            rowButton.hide();
                        }
                    }
                }
            }
        }
    }
}

export default clustersDataTable;     

