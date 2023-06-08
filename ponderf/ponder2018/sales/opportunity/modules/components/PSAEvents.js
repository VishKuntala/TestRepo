import { html } from "lit-element";
import psaEventsTemplate from "../../templates/components/psaEvents/psaEvents";
import PonderComponent from "./PonderComponent";

class PSAEvents extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        this.stateManager.subscribe("psaEventsData",
            async d => {
                this.requestUpdate(); //psaEventsData is updated re render the component
            });
    }

    async firstUpdated() {
        await this.initSubscriptions();
    }

    render() {
        return html`${psaEventsTemplate({
            psaEventsData: this.store.psaEventsData
        })}`;
    }
}

customElements.define("ponder-psa-events", PSAEvents);
