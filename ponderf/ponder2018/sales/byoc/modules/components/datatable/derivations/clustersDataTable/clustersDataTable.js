import $ from "jquery";
import * as R from 'ramda';
import ExcelJS from 'exceljs';
import * as deleteClusterButton from './deleteClusterButton.js';
import * as downloadExcelAndRerunButtons from './downloadExcelAndRerunButtons.js';



const clustersDataTable = ({ adminUser, instance }) => {


    const getClusterDetails = async (clusterId) => {
        const response = await $.ajax({
            url: `/sales/byoc/BYOC.aspx/ClusterDetails?clusterId=${clusterId}`,
            headers: { "Content-Type": "application/json" },
            type: 'get'
        });
        if (!instance.store.methodologyAttributes) {
            const methodologyResponse = await $.ajax({
                url: `${$("#hdnBaseSearchApiUrl").val()}/wst-ui-config/configType/methodology/byoc`,
                headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
                type: 'get'
            });
            instance.store.methodologyAttributes = JSON.parse(methodologyResponse);
            instance.generateMethodologyAttributesHtml();
        }

        const clusterDetails = response.d;
        const workbook = new ExcelJS.Workbook();
        const worksheet1 = workbook.addWorksheet("BYOC Cluster");
        worksheet1.columns = [
            { header: 'Address', key: 'address', width: 25 },
            { header: 'City', key: 'city', width: 25 },
            { header: 'State', key: 'state', width: 10 },
            { header: 'Zipcode', key: 'zipcode', width: 10 },
            { header: 'Latitude', key: 'latitude', width: 10 },
            { header: 'Longitude', key: 'longitude', width: 10 },
            { header: 'Location ID', key: 'location_id', width: 20 },
            { header: 'Company Name', key: 'company_name', width: 25 },
            { header: 'Notes', key: 'notes', width: 25 },
            { header: 'Indoor Coverage Score', key: 'coverage_score', width: 20 },
            { header: '5G', key: 'fiveg', width: 15 },
            { header: '5G+ mmWave', key: 'fiveg_plus_mmwave', width: 15 },
            { header: '5G+ C-Band', key: 'fiveg_plus_cband', width: 15 },
            { header: 'FirstNet', key: 'first_net', width: 15 },
            { header: 'Band 14', key: 'band_14', width: 15 },
            { header: 'Speed Experience', key: 'speed_experience', width: 17 },
            { header: 'Suitability for High Download Speed/Volume', key: 'legacy_device_text', width: 15 }
        ];
        worksheet1.addRows(clusterDetails);
        const worksheet2 = workbook.addWorksheet("ATT Proprietary");
        worksheet2.getRow(1).getCell(1).value = "AT&T Proprietary and Confidential Information";
        worksheet2.getRow(2).getCell(1).value = "Not for use or disclosure outside the AT&T companies except under written agreement.";
        
        if (instance.store.methodologyAttributes && instance.store.methodologyAttributes.length) {
            const worksheet3 = workbook.addWorksheet("Methodology");
            let rownum = 1;
            for (let i = 0; i < instance.store.methodologyAttributes.length; i += 1) {
                const attribute = instance.store.methodologyAttributes[i];
                if (attribute.header && attribute.header.length) {
                    const headerCell = worksheet3.getRow(rownum).getCell(1)
                    headerCell.value = attribute.header;
                    headerCell.font = { bold: true, underline: true };
                    rownum += 1;
                }
                for (let j = 0; j < attribute.content.length; j += 1) {
                    worksheet3.getRow(rownum).getCell(1).value = attribute.content[j];
                    rownum += 1;
                }
            }
        }
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
                        url: `/sales/byoc/BYOC.aspx/RerunCluster?clusterId=${clusterId}`,
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
        } else if (filterAttribute === 'SHARED') {
            accessType = 'shared';
        }
        window.open(`/sales/scoring/Scoring.aspx?channel=byoc&accessType=${accessType}&clusterId=${clusterId}`, '_blank');

    }

    const deleteCluster = async (clusterId) => {
        $('.ui.delete.modal')
            .modal({
                closable: false,
                onApprove: async function () {
                    const postData = { clusterId };
                    const response = await $.ajax({
                        url: '/sales/byoc/BYOC.aspx/DeleteCluster',
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

