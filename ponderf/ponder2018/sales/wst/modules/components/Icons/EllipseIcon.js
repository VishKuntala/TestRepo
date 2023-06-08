import { LitElement, svg } from "lit-element";

class EllipseIcon extends LitElement {
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
                <circle fill=${color} cx="4" cy="4" r="4" />
            </svg>
        `;
    }
}

customElements.define("ellipse-icon", EllipseIcon);
