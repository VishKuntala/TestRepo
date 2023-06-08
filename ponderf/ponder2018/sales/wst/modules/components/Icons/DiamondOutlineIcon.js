import { LitElement, svg } from "lit-element";

class DiamondOutlineIcon extends LitElement {
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
            <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
<path stroke=${color} d="M10.8303 5.83029L6.16971 1.16971C6.07598 1.07598 5.92402 1.07598 5.83029 1.16971L1.16971 5.83029C1.07598 5.92402 1.07598 6.07598 1.16971 6.16971L5.83029 10.8303C5.92402 10.924 6.07598 10.924 6.16971 10.8303L10.8303 6.16971C10.924 6.07598 10.924 5.92402 10.8303 5.83029Z" stroke-width="2"/>
</svg>

        `;
    }
}

customElements.define("diamond-outline-icon", DiamondOutlineIcon);