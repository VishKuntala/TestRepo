import { html } from "lit-element";
import appBodyTemplate from "../../templates/components/appBody/appBody";
import PonderComponent from "./PonderComponent";

class AppBody extends PonderComponent {
    constructor() {
        super();
        this.isCardsOpen = true;
        this.isPanelOpen = true;
    }

    async handleOnPanelToggle() {
        const mapSectionEl = $('.map-section');
        const panelSectionEl = $('.panel-section');
        const panelToggleIcon = $("#panel-toggle-icon");

        if (this.isPanelOpen) {
            mapSectionEl.removeClass('panel-open')
            panelSectionEl.removeClass('panel-open')
            panelToggleIcon.addClass('compress').removeClass('expand')           
        } else {
            mapSectionEl.addClass('panel-open')
            panelSectionEl.addClass('panel-open')
            panelToggleIcon.addClass('expand').removeClass('compress')
        }
        
        this.isPanelOpen = !this.isPanelOpen;
    }

    async handleOnCardToggle() {
        $('.ponder-app-body .accordion').accordion(this.isCardsOpen === true ? 'close' : 'open', 0);
        $(".toggle-panels-btn i").attr("class", this.isCardsOpen === true ? "fitted eye slash icon" : "fitted eye icon");

        this.isCardsOpen = !this.isCardsOpen;
    }

    // render the html from the template in the DOM
    render() {
        return html`${appBodyTemplate({
            filterDerivation: `${this.store.config.tool}/${
                this.store.config.tool
            }.js`,
            config: this.store.config,
            zoomIn: () => this.store.zoomIn(),
            zoomOut: () => this.store.zoomOut(),
            toggleCards: this.handleOnCardToggle,
            togglePanel: this.handleOnPanelToggle,
            baseApiUrl: this.store.baseApiUrl,
        })}`;
    }
}

customElements.define("ponder-appbody", AppBody);
