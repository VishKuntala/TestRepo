import $ from "jquery";
import * as R from 'ramda';
import * as compareCheckbox from './compareCheckbox.js';



const svidDataTable = ({ adminUser, instance }) => {

    const fetchData = async () => {
        let { svIds, salesRepId, statecode, indoorCovScore, fiveg, band14, tputText, roamingDependency, zipcode, smId, sortCriteria, legacyPen } = instance.store;
        if (smId === '' && salesRepId === '') {
            return;
        }

        // $(`#${instance.id} .ui.submit`).addClass('loading');

        if (svIds) {
            svIds = '\'' + svIds.split(',').join('\',\'') + '\'';
        }
        if (salesRepId) {
            salesRepId = '\'' + salesRepId.split(',').join('\',\'') + '\'';
        }
        if (statecode) {
            statecode = '\'' + statecode.split(',').join('\',\'') + '\'';
        }
        if (indoorCovScore) {
            indoorCovScore = '\'' + indoorCovScore.split(',').join('\',\'') + '\'';
        }
        if (fiveg) {
            fiveg = '\'' + fiveg.split(',').join('\',\'') + '\'';
        }
        if (band14) {
            band14 = '\'' + band14.split(',').join('\',\'') + '\'';
        }
        if (tputText) {
            tputText = '\'' + tputText.split(',').join('\',\'') + '\'';
        }
        if (roamingDependency) {
            roamingDependency = '\'' + roamingDependency.split(',').join('\',\'') + '\'';
        }
        if (zipcode) {
            zipcode = '\'' + zipcode.split(',').join('\',\'') + '\'';
        }
        if (legacyPen) {
            legacyPen = '\'' + legacyPen.split(',').join('\',\'') + '\'';
        }

        const postData = {
            smId, salesRepId, sortCriteria,
            svIds: svIds || '',
            zipcode: zipcode || '',
            statecode: statecode || '',
            indoorCovScore: indoorCovScore || '',
            fiveg: fiveg || '',
            band14: band14 || '',
            tputText: tputText || '',
            roamingDependency: roamingDependency || '',
            limit: "500",
            legacyPen: legacyPen || ''
        };
        const response = await $.ajax({
            url: `/sales/wst/Scoring.aspx/SVData`,
            headers: { "Content-Type": "application/json" },
            type: 'post',
            data: JSON.stringify(postData),
            processData: false,
        });
        return response.d;


    }

    const prependColumns = {
        data: null,
        "defaultContent": compareCheckbox.html({ adminUser, id: instance.id })
    };

 
    const attachEventHandlers = async () => {
        $('#' + instance.id).off().on('draw.dt', function () {
            $('#chkCompareSvid:checked').prop('checked', false);
            for (let i = 0; i < instance.store.compareSvids.length; i += 1) {
                $(`input[type="checkbox"][rowid="${instance.store.compareSvids[i]}"]`).prop('checked', true);
            }
            if (instance.store.compareSvids.length >= 2) {
                $('#chkCompareSvid:not(:checked)').attr("disabled", true);
            } else {
                $('#chkCompareSvid:not(:checked)').removeAttr("disabled");
            }
        });


        $(`#${instance.id} tbody`).on('click', 'tr', function () {

            const clickedRow = $(this).closest('tr');
            const data = instance.table.row(clickedRow).data();
            // we add the currentdatetimestring to trigger the publish of the zoomToPoint event
            instance.store.zoomToPoint = [data.latitude, data.longitude, Date.now().toString()];
        });
    }


    const initSubscriptions = () => {
        instance.stateManager.subscribe("mapData",
            async d => {
                const takeFiveHundred = R.take(500, d);
                await instance.reloadTableData(takeFiveHundred);
                if (instance.table) {
                    instance.table.columns.adjust();
                }
                $(window).resize();
                
            });
        instance.stateManager.subscribe("removeAllCards",
            async d => {
                $('#chkCompareSvid:checked').prop('checked', false);
                instance.store.compareSvids = [];
                $('#chkCompareSvid:not(:checked)').removeAttr("disabled");
            });
        instance.stateManager.subscribe("removeCard",
            async d => {
                if (d && !R.is(Array, d)) {
                    $(`input[type="checkbox"][rowid="${d}"]`).prop('checked', false);
                    instance.store.compareSvids = R.without([d], instance.store.compareSvids);
                    if (instance.store.compareSvids.length < 2) {
                        $('#chkCompareSvid:not(:checked)').removeAttr("disabled");
                    }
                }
            });
        instance.stateManager.subscribe("sortCriteria",
            async d => {
                const data = await fetchData();
                await instance.reloadTableData(data);
                /* console.log(R.toLower(instance.store.sortCriteria));
                const sortAsc = R.sortBy(R.prop(R.toLower(instance.store.sortCriteria)));
                const sortDesc = R.pipe(sortAsc, R.reverse);
                if (instance.store.mapData) {
                    const takeFiveHundred = R.take(500, sortDesc(instance.store.mapData));
                    console.log(takeFiveHundred);
                    await instance.reloadTableData(takeFiveHundred);
                } */
            });
        instance.stateManager.subscribe("compareSvid",
            async d => {
                const compareEntry = `${d.svid}_${d.latitude}_${d.longitude}`;
                if (d && !R.is(Array, d)) {
                    if (R.includes(compareEntry, instance.store.compareSvids)) {
                        instance.store.compareSvids = R.without([compareEntry], instance.store.compareSvids);
                        instance.store.cardsData = R.filter(item => item.id !== compareEntry, instance.store.cardsData);
                        if (instance.store.compareSvids.length < 2) {
                            $('#chkCompareSvid:not(:checked)').removeAttr("disabled");
                        }
                    } else {
                        if (instance.store.compareSvids.length < 2) {
                            instance.store.compareSvids = R.append(compareEntry, instance.store.compareSvids);
                            instance.store.cardsData = R.append({ id: compareEntry, title: d.svid_name, description: '' }, instance.store.cardsData);
                            if (instance.store.compareSvids.length === 2) {
                                $('#chkCompareSvid:not(:checked)').attr("disabled", true);

                            }

                        }

                    }
                }
                if (instance.store.cardsData.length) {
                    $('.ponderCards.message').removeClass('hidden').addClass('visible');

                } else {
                    $('.ponderCards.message').removeClass('visible').addClass('hidden');
                }

            });
    }

    return {
        prependColumns: null,
        appendColumns: null,
        initSubscriptions,
        createdCell: function (td, cellData, rowData, row, col) {
            if (!isNaN(cellData)) {
                $(td).addClass('center aligned');
            }
        },
        nowrap: true,
        dataSrc: result => instance.store.filterClusterTable ? R.filter(instance.store.filterClusterTable, result.d) : result.d,
        dataTableConfig: {
            searching: true,
            paging: true,
            pageLength: 6,
            "scrollX": true,
            fixedColumns: {
                leftColumns: 2
            },
            lengthChange: false,
            "createdRow": function (row, data, index) {
                const dataTableRow = $(row);
                const checkbox = dataTableRow.find('input[type="checkbox"]');
                const id = `${data.svid}_${data.latitude}_${data.longitude}`;
                $(checkbox[0]).attr("rowid", id);
            }


        },
        attachEventHandlers
    }
}

export default svidDataTable;     

