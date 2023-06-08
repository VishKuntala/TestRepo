import { html } from "lit-element";
import devToolsTemplate from "../../templates/components/devTools/devTools";
import PonderComponent from "./PonderComponent";

class DevTools extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        this.stateManager.subscribe("currentZoom", async () => {
            this.requestUpdate();
        });
    }


    async closeTools() {
        $(".ponder-dev-tools").hide();
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated() {
        await this.initSubscriptions();
    }

    // render the html from the template in the DOM
    render() {
        return html`${devToolsTemplate({
            currentZoom: this.store.currentZoom,
            closeTools: this.closeTools,
        })}`;
    }
}

customElements.define("ponder-dev-tools", DevTools);
