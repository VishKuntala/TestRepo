import { LitElement, svg } from "lit-element";

class MarkerIcon extends LitElement {
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
<g id="Marker">
<path fill=${color} d="M8.76946 3.75973C8.76946 5.47119 6.47837 8.51814 5.47382 9.7753C5.23296 10.0749 4.7865 10.0749 4.54564 9.7753C3.52346 8.51814 1.25 5.47119 1.25 3.75973C1.25 1.68326 2.93326 0 5.00973 0C7.08541 0 8.76946 1.68326 8.76946 3.75973Z" />
</g>
</svg>

        `;
    }
}

customElements.define("marker-icon", MarkerIcon);