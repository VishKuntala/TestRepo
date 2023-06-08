import { LitElement, svg } from "lit-element";

class TriangleOutlineIcon extends LitElement {
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
            <svg width="12" height="10" viewBox="0 0 12 10" fill="none" xmlns="http://www.w3.org/2000/svg">
<path stroke=${color} d="M1.2295 8.6328L5.79648 1.32563C5.89048 1.17523 6.10952 1.17523 6.20352 1.32563L10.7705 8.6328C10.8704 8.79265 10.7555 9 10.567 9H1.43302C1.24451 9 1.12959 8.79265 1.2295 8.6328Z" stroke-width="2"/>
</svg>

        `;
    }
}

customElements.define("triangle-outline-icon", TriangleOutlineIcon);