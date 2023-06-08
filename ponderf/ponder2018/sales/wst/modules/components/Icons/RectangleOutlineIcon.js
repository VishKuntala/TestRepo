import { LitElement, svg } from "lit-element";

class RectangleOutlineIcon extends LitElement {
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
<rect stroke=${color} x="1" y="1" width="8" height="8" rx="0.24" stroke-width="2"/>
</svg>

        `;
    }
}

customElements.define("rectangle-outline-icon", RectangleOutlineIcon);