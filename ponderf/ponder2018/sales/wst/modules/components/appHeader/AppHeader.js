import { html } from 'lit-element';
import { until } from 'lit-html/directives/until.js';
import * as R from 'ramda';
import PonderComponent from '../PonderComponent';

class AppHeader extends PonderComponent {
    constructor() {
        super();
        this.derivation = `${$('#hdnAppName').val()}/${$('#hdnAppName').val()}.js`;
        this.derivedClass = null;
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            derivation: {
                attribute: 'derivation',
                type: String
            }
        }
    }

   

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
        this.derivedClass = DerivedClass({ adminUser, instance: this });
    }

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
        this.derivedClass = DerivedClass({ adminUser, instance: this });
        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;
    }

    // showing modal
    #showScoringDetailsModal() {
        $('.coverageScoreHelp.modal').modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    #showDataDatesModal() {
        const instance = this;
        $('.dataDates.modal').modal({
            onShow: async function () {
                if (!instance.store.dataDates) {
                    const { data } = await instance.getData(
                        `${instance.store.baseApiUrl}-ui-config/configType/dataDates?tool=wst&appName=${$("#hdnAppName").val()}`
                    );
                    instance.store.dataDates = data;
                }
                $('#dataDatesInfo').html(R.map(item => `<div>${item}</div>` , R.pluck('display_name',instance.store.dataDates)));
            }
        }).modal('setting', 'transition', 'fade up')
            .modal('show');
        
    }

    async #fetchAdditionalInfo() {
        const instance = this;
        // const response = await instance.postData(`${instance.store.baseApiUrl}-docs/${instance.store.config.tool}/faq?start=${Date.now()}`);
        // $("#pdf_modal").html(`<i class="close icon"></i><iframe src='${response.data}#zoom=FitW'></iframe>`);
        $("#pdf_modal").html(`
            <iframe src=${instance.store.rootUrl}sales/wst/docs/${instance.store.config.tool}/ATT_Business_PONDER_Gameplan_User_Guide_Feb2023.pdf#zoom=FitW'></iframe>
            <div class="actions">
                <div class="ui positive green button">Close</div>
            </div>
        `);
        $('.pdf_modal.modal').modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    async #sendSupportEmail() {
        document.location = `mailto:g16274@att.com?subject=PONDER%20%2D%20Fusion%20GamePlan%20Feedback`;
    }

    async #navigateToByoc() {
        window.open(`/sales/byoc/BYOC.aspx`, '_blank');
    }

  

    render() {
        const instance = this;
        const adminUser = $('#hdnViewerAttId').val();
        return html`
                ${until(
                    import(`./derivations/${this.derivation}`)
                        .then(response => {
                            const DerivedClass = response.default;
                            instance.derivedClass = DerivedClass({ adminUser, instance });
                            return instance.appState.availableChannels.length ? html`${instance.derivedClass.appHeaderTemplate({
                                rootUrl: instance.store.rootUrl,
                                baseApiUrl: instance.store.baseApiUrl,
                                baseSearchApiUrl: instance.store.baseSearchApiUrl,
                                showScoringDetailsModal: instance.#showScoringDetailsModal,
                                sendSupportEmail: instance.#sendSupportEmail,
                                navigateToByoc: instance.#navigateToByoc,
                                fetchAdditionalInfo: instance.#fetchAdditionalInfo,
                                showAdditionalInfo: instance.store.config.showAdditionalInfo,
                                showDataDatesModal: instance.#showDataDatesModal
                            })}` : html`<div/>`
                    ;
                })
                .catch((error) => { console.error('Error:', error); }),
            html`<h4>Loading...</h4>`
        )}`;
    }
}

customElements.define('ponder-appheader', AppHeader);

