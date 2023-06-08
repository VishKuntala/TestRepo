import { LitElement, svg } from "lit-element";

class MarkerOutlineIcon extends LitElement {
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
            <svg width="10" height="12" viewBox="0 0 10 12" fill="none" xmlns="http://www.w3.org/2000/svg">
<g id="Marker-Outline">
<path stroke=${color} d="M8.76946 4.75973C8.76946 6.47119 6.47837 9.51814 5.47382 10.7753C5.23296 11.0749 4.7865 11.0749 4.54564 10.7753C3.52346 9.51814 1.25 6.47119 1.25 4.75973C1.25 2.68326 2.93326 1 5.00973 1C7.08541 1 8.76946 2.68326 8.76946 4.75973Z" stroke-width="2"/>
</g>
</svg>

        `;
    }
}

customElements.define("marker-outline-icon", MarkerOutlineIcon);