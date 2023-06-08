import { LitElement, svg } from "lit-element";

class RectangleIcon extends LitElement {
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
            width: {
                attribute: "width",
                type: String,
            },
            height: {
                attribute: "height",
                type: String,
            }
        };
    }

    render() {
        const { color, width, height  } = this;

        return svg`
            <svg width=${width} height=${height} viewBox="0 0 8 8" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect fill=${color} id="Rectangle" width="8" height="8" rx="0.24" />
</svg>

        `;
    }
}

customElements.define("rectangle-icon", RectangleIcon);