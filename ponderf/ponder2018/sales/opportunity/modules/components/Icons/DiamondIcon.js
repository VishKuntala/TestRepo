import { LitElement, svg } from "lit-element";

class DiamondIcon extends LitElement {
    constructor() {
        super();
        this.color = "blue";
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            color: {
                attribute: "color",
                type: String,
            },
        };
    }

    render() {
        const { color } = this;

        return svg`
            <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill=${color} d="M9.83029 4.83029L5.16971 0.169706C5.07598 0.0759798 4.92402 0.0759793 4.83029 0.169705L0.169706 4.83029C0.0759798 4.92402 0.0759793 5.07598 0.169705 5.16971L4.83029 9.83029C4.92402 9.92402 5.07598 9.92402 5.16971 9.83029L9.83029 5.16971C9.92402 5.07598 9.92402 4.92402 9.83029 4.83029Z" />
            </svg>
        `;
    }
}

customElements.define("diamond-icon", DiamondIcon);