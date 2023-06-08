import { LitElement, svg } from "lit-element";

class StarIcon extends LitElement {
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
<g id="Star">
<path fill=${color} d="M5.5354 0.332064L6.75612 2.80223L9.48748 3.19943C9.9776 3.27026 10.1739 3.87276 9.81864 4.21791L7.84288 6.12278L8.31023 8.83735C8.39434 9.32821 7.87683 9.6937 7.44288 9.46608L4.99995 8.20152L2.55777 9.48325C2.12306 9.71086 1.60627 9.34519 1.69023 8.85451L2.15758 6.13994L0.18126 4.21829C-0.17378 3.87313 0.0223781 3.2707 0.512419 3.19981L3.24378 2.8026L4.4645 0.332437C4.68465 -0.113517 5.31712 -0.107976 5.5354 0.332064Z" />
</g>
</svg>

        `;
    }
}

customElements.define("star-icon", StarIcon);