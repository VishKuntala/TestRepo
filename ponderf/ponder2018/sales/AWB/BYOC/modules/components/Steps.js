import { html } from 'lit-element';
import $ from "jquery";
import jqueryValidation from 'jquery-validation';
import shortid from 'shortid';
import Papa from 'papaparse';
import ExcelJS from 'exceljs';
import validate from 'validate.js';
import { saveAs } from 'file-saver';
import LZString from 'lz-string';
import * as R from 'ramda';
import stepsTemplate from '../../templates/components/steps.js';
import PonderComponent from './PonderComponent';




class Steps extends PonderComponent {


    constructor() {
        super();
        this.formData = new FormData();
        this.validationErrors = [];
    }


    #navigateSteps(currentlyActiveStepIndex) {
        const numberOfSteps = $($('.step')).length;
        $('.step').removeClass('active');
        $($('.step')[currentlyActiveStepIndex]).addClass('active');
        $('.attached.segment').hide();
        $($('.attached.segment')[currentlyActiveStepIndex]).show();
        $('button.next').show();
        $('button.prev').show();
        if (currentlyActiveStepIndex === numberOfSteps - 1) {
            $('button.next').hide();
        } else if (currentlyActiveStepIndex === 0) {
            $('button.prev').hide();
        }
        this.attachEventHandlers();
    }


    #navigateNext() {
        const fileCount = $('input[type=file]')[0].files.length;
        if (fileCount === 0) {
            $('.negative.missingfile.message').removeClass('hidden').addClass('visible');
            return;
        }
        if (!this.store.csvData || this.store.csvData.length === 0) {
            $('.negative.missingfile.message').text('Import the file before proceeding to the next step');
            $('.negative.missingfile.message').removeClass('hidden').addClass('visible');
            return;
        }
        this.#navigateSteps($('.step.active').prevAll('.step').length + 1);

    }


    #navigatePrev() {
        this.#navigateSteps($('.step.active').prevAll('.step').length - 1);
    }

    #clearForm() {
        $('#txtClusterName').val('');
        $('#txtSharedUids').val('');
        $('#chkPublicCluster').prop('checked', false);
        $('#hdnClusterId').val('');
        $('#frmMode').val('');
        $('#files').val('');
        $('.negative.missingfile.message').removeClass('visible').addClass('hidden');
        $('.positive.message').removeClass('visible').addClass('hidden');
        $('.negative.missingdata.message').removeClass('visible').addClass('hidden');
        this.store.csvData = [];
    }

    #clearErrorMessages() {
        $('.negative.missingfile.message').removeClass('visible').addClass('hidden');
        $('.positive.message').removeClass('visible').addClass('hidden');
        $('.negative.missingdata.message').removeClass('visible').addClass('hidden');
        if ($(".ui.form").data('validator')) {
            $(".ui.form").data('validator').resetForm();
        }
        this.validationErrors = [];
    }


    async #saveCluster(e) {
    $('#btnSubmit').addClass('loading');
    const validationResult = $('.ui.form').valid();
    if (!validationResult) {
        $('#btnSubmit').removeClass('loading');
        return validationResult;
    }

    const clusterName = $('#txtClusterName').val();
    const sharedUids = $('#txtSharedUids').val().toLowerCase();
    const isPublicCluster = $('#chkPublicCluster').prop('checked') ? 1 : 0;
    // first time the cluster is created, the batchId is set to null
    // when the cluster is re-run, the batchid is set to the clusterId of the cluster that is being re-run.
    const batchId = null;
    let postData = { csvData: LZString.compressToBase64(JSON.stringify(this.store.csvData)) };
    if ($('#frmMode').val() === 'rerun') {
        postData = Object.assign(postData, { clusterId: $('#hdnClusterId').val() });
    }
    postData = Object.assign(postData, { clusterName, sharedUids, isPublicCluster, batchId });
    const response = await $.ajax({
        url: `/sales/AWB/byoc/BYOC.aspx/${$('#frmMode').val() === 'rerun' ? 'RerunCluster' : 'SaveCluster'}`,
        headers: { "Content-Type": "application/json" },
        type: 'post',
        data: JSON.stringify(postData),
        processData: false,
    });
    // this.store.newRow = shortid.generate();
    this.store.saveCluster = shortid.generate();
    this.#clearForm();
    this.#navigatePrev();
    /* $('.uploadCluster.modal')
        .modal('setting', 'transition', 'fade down')
        .modal('close'); */
    $('#btnSubmit').removeClass('loading');
    $('.ui.cancel').click();
    // return false;

}

async #generateExceptionFile() {
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Exceptions");
    worksheet.columns = [
        { header: 'Exception', key: 'exception', width: 50 },
    ];
    worksheet.addRows(this.validationErrors)
    const buffer = await workbook.xlsx.writeBuffer();
    const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
    saveAs(blob, "exceptions.xlsx");
}

async #downloadTemplateFile() {
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("BYOC");
    worksheet.columns = [
        { header: 'ADDRESS (Required)', width: 25 },
        { header: 'CITY (Required)', width: 25 },
        { header: 'STATE ABBR (Required)', width: 25 },
        { header: 'ZIPCODE (Required)', width: 25 },
        { header: 'LATITUDE (Optional)', width: 25 },
        { header: 'LONGITUDE (Optional)', width: 25 },
        { header: 'LOCATION_ID (Optional)', width: 25 },
        { header: 'COMPANY_NAME (Optional)', width: 25 },
        { header: 'NOTES (Optional)', width: 25 },
        //{ header: 'COVERAGE_SCORE', width: 25 },
        //{ header: 'COVERAGE_SCORE_RANK', width: 25 },
        //{ header: 'FIVEG', width: 25 },
        //{ header: 'FIVEG_PLUS', width: 25 },
        //{ header: 'TPUT_TEXT', width: 25 },
        //{ header: 'ROAM_TEXT', width: 25 },
        //{ header: 'FIRST_NET', width: 25 },
        //{ header: 'BAND_14', width: 25 },
        //{ header: 'LEGACY_DEVICE_TEXT', width: 25 }
    ];
    const buffer = await workbook.xlsx.writeBuffer();
    const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
    saveAs(blob, "byoc_template.xlsx");

}

async #validateData(data) {
    const constraints = {
        'ADDRESS (Required)': function (value, attributes, attributeName, options, constraints) {
            if (attributes['LATITUDE (Optional)'] && attributes['LONGITUDE (Optional)'] &&
                attributes['LATITUDE (Optional)'].trim() !== '' && attributes['LATITUDE (Optional)'].trim() !== '') {
                return { presence: { allowEmpty: true } };
            }
            return { presence: { allowEmpty: false } };
        },
        //'CITY (Required)': { presence: { allowEmpty: false } },
        //'STATE ABBR (Required)': { presence: { allowEmpty: false }, length: { is: 2 } },
        //'ZIPCODE (Required)': { presence: { allowEmpty: false } },
        'CITY (Required)': function (value, attributes, attributeName, options, constraints) {
            if (attributes['LATITUDE (Optional)'] && attributes['LONGITUDE (Optional)'] &&
                attributes['LATITUDE (Optional)'].trim() !== '' && attributes['LATITUDE (Optional)'].trim() !== '') {
                return { presence: { allowEmpty: true } };
            }
            return { presence: { allowEmpty: false } };
        },
        'STATE ABBR (Required)': function (value, attributes, attributeName, options, constraints) {
            if (attributes['LATITUDE (Optional)'] && attributes['LONGITUDE (Optional)'] &&
                attributes['LATITUDE (Optional)'].trim() !== '' && attributes['LATITUDE (Optional)'].trim() !== '') {
                return { presence: { allowEmpty: true } };
            }
            return { presence: { allowEmpty: false } };
        },
        'ZIPCODE (Required)': function (value, attributes, attributeName, options, constraints) {
            if (attributes['LATITUDE (Optional)'] && attributes['LONGITUDE (Optional)'] &&
                attributes['LATITUDE (Optional)'].trim() !== '' && attributes['LATITUDE (Optional)'].trim() !== '') {
                return { presence: { allowEmpty: true } };
            }
            return { presence: { allowEmpty: false } };
        },
        'LATITUDE (Optional)': function (value, attributes, attributeName, options, constraints) {
            if (attributes['ADDRESS (Required)'] && attributes['ADDRESS (Required)'].trim() !== '') {
                return { presence: { allowEmpty: true } };
            }
            return { presence: { allowEmpty: false } };
        },
        'LONGITUDE (Optional)': function (value, attributes, attributeName, options, constraints) {
            if (attributes['ADDRESS (Required)'] && attributes['ADDRESS (Required)'].trim() !== '') {
                return { presence: { allowEmpty: true } };
            }
            return { presence: { allowEmpty: false } };
        },
    };
    for (let i = 0; i < data.length; i += 1) {
        try {
            await validate.async(data[i], constraints, { format: "flat" });
        }
        catch (errors) {
            if (errors instanceof Error) {
                // This means an exception was thrown from a validator
                console.err("An error ocurred", errors);
            } else {
                this.validationErrors.push({ "exception": `Row# ${data[i].rowIndex}: ${errors.join()}` });
            }
        }

    }
}


async #parseFiles() {
    this.#clearErrorMessages();
    // $('.negative.missingfile.message').removeClass('visible').addClass('hidden');
    const fileCount = $('input[type=file]')[0].files.length;
    if (fileCount === 0) {
        $('.negative.missingfile.message').removeClass('hidden').addClass('visible');
        return;
    }
    $('#btnImport').addClass('loading');
    const file = $('input[type=file]')[0].files[0];
    const wb = new ExcelJS.Workbook();
    const reader = new FileReader();
    let headers = [];
    let dataRows = [];
    reader.readAsArrayBuffer(file);
    reader.onload = async () => {
        try {
            const buffer = reader.result;
            const workbook = await wb.xlsx.load(buffer);
            workbook.eachSheet((sheet, id) => {
                sheet.eachRow({ includeEmpty: false }, (row, rowIndex) => {
                    let dataRow = [];
                    row.eachCell({ includeEmpty: true }, (cell, cellIndex) => {
                        // row 1 contains the headers
                        if (rowIndex === 1) {
                            headers.push(cell.text.richText ? R.pluck('text', cell.text.richText).join('') : cell.text);
                        }
                        else {
                            // get the data rows
                            dataRow.push(cell.text.richText ? R.pluck('text', cell.text.richText).join('') : cell.text);
                        }
                    })
                    // exclude row 1 which contains the headers
                    if (rowIndex > 1) {
                        dataRows.push(R.prepend(rowIndex, dataRow));
                    }
                })
            })
            //const data = R.map(datarow => R.zipObj(R.prepend('rowIndex', headers), datarow), dataRows);
            const data = R.map(datarow => {
                const repetition = (headers.length - datarow.length) - 1; // reduce by one for thr rowIndex column that will be appended to headers
                for (let i = 0; i < repetition; i += 1) {
                    datarow.push('');
                }
                return R.zipObj(R.prepend('rowIndex', headers), datarow);
            }, dataRows);
            await this.#validateData(data);
            if (this.validationErrors.length) {
                $('.negative.missingdata.message').removeClass('hidden').addClass('visible');
                $('#btnImport').removeClass('loading');
                $('button.next').prop('disabled', true);
                return;
            } else if (dataRows.length === 0) {
                $('.negative.missingfile.message').removeClass('hidden').addClass('visible');
                $('.negative.missingfile.message').text('No locations found to upload');
                $('#btnImport').removeClass('loading');
                $('button.next').prop('disabled', true);
                return;
            }
            else if (dataRows.length > 10000) {
                $('.negative.missingfile.message').removeClass('hidden').addClass('visible');
                $('.negative.missingfile.message').text('You can only upload a maximum of 10,000 locations');
                $('#btnImport').removeClass('loading');
                $('button.next').prop('disabled', true);
                return;
            }
            else {
                $('.positive.message').removeClass('hidden').addClass('visible');
                $('#spnNoOfLocations').text(`${dataRows.length} location${dataRows.length === 1 ? '' : 's'}`)
            }
            this.store.csvData = data;
            this.formData.append('file', file);
            $('#btnImport').removeClass('loading');
            $('button.next').prop('disabled', false);
        }
        catch (ex) {
            $('.negative.missingfile.message').removeClass('hidden').addClass('visible');
            $('.negative.missingfile.message').text('Data can only be uploaded from an Excel file');
            $('#btnImport').removeClass('loading');
            $('button.next').prop('disabled', true);
            return;
        }
    }

}

async #sendSupportEmail() {
    document.location = `mailto:g16274@att.com?subject=PONDER%20–%20BYOC%20Feedback`;
}


// updated is called after the html is rendered on the DOM.

async updated(changedProperties) {
    this.attachEventHandlers();
}

attachEventHandlers() {
    $('#files').on("change", () => this.#clearErrorMessages());
}


// render the html from the template in the DOM

render() {

    return html`${stepsTemplate({
        handleClick: this.#parseFiles,
        navigateNext: this.#navigateNext,
        navigatePrev: this.#navigatePrev,
        saveCluster: this.#saveCluster,
        generateExceptionFile: this.#generateExceptionFile,
        downloadTemplateFile: this.#downloadTemplateFile,
        sendSupportEmail: this.#sendSupportEmail
    })}`;

}




  }

customElements.define('ponder-steps', Steps);