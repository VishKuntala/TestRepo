import { html } from 'lit-element';
import { until } from 'lit-html/directives/until.js';
import $ from "jquery";
import * as R from 'ramda';
import appTemplate from '../../templates/components/app.js';
import PonderComponent from './PonderComponent';
import grants from '../auth/index.js';



class App extends PonderComponent {


    constructor() {
        super();
        this.subscriptions = [];
        this.#setUserPermissions();
    }

    async #setUserPermissions() {
        if (!this.appState.userGroups) {
            this.getAssignedUserRoles();
        }
        const userPermissions = [];
        const userRoles = R.keys(grants);
        for (let i = 0; i < userRoles.length; i += 1) {
            if (R.includes(userRoles[i], this.appState.userGroups)) {
                userPermissions.push(grants[userRoles[i]]);
            }
        }
        this.appState.userPermissions = R.mergeAll(userPermissions);
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            }
        }
    }

    async #getData(url) {
    return (await $.ajax({
        url,
        headers: { "Content-Type": "application/json" }
    })).d;
    }

    // set initial data needed for the app components
    async #initializeStore() {
        const adminUser = $('#hdnViewerAttId').val();
        this.store.filterClusterTable = r => r.admin_user === adminUser;
        return true;
}

#navigateToFirstStep() {
    $('.step').removeClass('active');
    $($('.step')[0]).addClass('active');
    $('.attached.segment').hide();
    $($('.attached.segment')[0]).show();
    $('button.next').show();
    $('button.prev').hide();
}

#clearForm() {
    this.#navigateToFirstStep();
    $('#txtClusterName').val('');
    $('#txtSharedUids').val('');
    $('#chkPublicCluster').prop('checked', false);
    $('#hdnClusterId').val('');
    $('#frmMode').val('');
    $('#files').val('');
    $('.negative.missingfile.message').removeClass('visible').addClass('hidden');
    $('.positive.message').removeClass('visible').addClass('hidden');
    $('.negative.missingdata.message').removeClass('visible').addClass('hidden');
    if ($(".ui.form").data('validator')) {
        $(".ui.form").data('validator').resetForm();
    }
    this.store.csvData = [];
}

    // showing modal
    #showAcknowledgeModal() {
        $('.acknowledge.modal').modal({ 
            closable: false,
            onApprove: async function () {
                const response = await $.ajax({
                    url: `/sales/byoc/BYOC.aspx/LogAcknowledge`,
                    headers: { "Content-Type": "application/json" },
                    type: 'post',
                    processData: false
                });
                $('.acknowledge.modal')
                    .modal('close');
            }
        }).modal('setting', 'transition', 'fade up')
            .modal('show');
    }

#showModal() {
    const instance = this;
    $('.uploadCluster.modal').modal({
        onDeny: async function () {
            instance.#clearForm();
        },
        onHide: async function () {
            instance.#clearForm();
        }
    }).modal('setting', 'transition', 'fade up')
    .modal('show');
   }

    #filterData(e) {
        const filterAttribute = e.target.getAttribute('data-filter-attr');
        const adminUser = $('#hdnViewerAttId').val();
        if (filterAttribute === 'MY') {
            this.store.filterClusterTable = r => r.admin_user === adminUser;
        } else if (filterAttribute === 'PUBLIC') {
            this.store.filterClusterTable = r => r.view_public === 1;
        } else if (filterAttribute === 'SHARED') {
            this.store.filterClusterTable = r => R.contains(adminUser, r.view_user || '');
        } else {
            this.store.filterClusterTable = r => 1 === 1;
        }
    }



    // render the html from the template in the DOM

    render() {
        return html`
                ${ until(
                    this.#initializeStore()
                .then(response => {
                    return html`${appTemplate({ showModal: this.#showModal, filterData: this.#filterData})}`;
                })
                .catch((error) => { console.error('Error:', error); }),
            html`<h4>Loading...</h4>`
        )}`;
    }

    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {
        const instance = this;

    }

    async updated(changedProperties) {
        await this.initSubscriptions();

    }

       // first updated is called the first time the html is rendered on the DOM. 
       async firstUpdated(changedProperties) {
        this.#showAcknowledgeModal();
    }

}

customElements.define('ponder-app', App);