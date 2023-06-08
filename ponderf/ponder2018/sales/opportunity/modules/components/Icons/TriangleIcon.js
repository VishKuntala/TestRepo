import { LitElement, svg } from "lit-element";

class TriangleIcon extends LitElement {
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
            <svg width="10" height="8" viewBox="0 0 10 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill=${color} d="M0.2295 7.6328L4.79648 0.325631C4.89048 0.175231 5.10952 0.17523 5.20352 0.325631L9.7705 7.6328C9.87041 7.79265 9.75549 8 9.56698 8H0.433019C0.244515 8 0.129592 7.79265 0.2295 7.6328Z" />
            </svg>
        `;
    }
}

customElements.define("triangle-icon", TriangleIcon);