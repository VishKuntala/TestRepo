import { LitElement, svg } from "lit-element";

class StarOutlineIcon extends LitElement {
    constructor() {
        super();
        this.color = "#000";
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
            <svg width="14" height="12" viewBox="0 0 14 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g id="Star-Outline">
                    <path stroke=${color} d="M7.5354 1.33206L8.75612 3.80223L11.4875 4.19943C11.9776 4.27026 12.1739 4.87276 11.8186 5.21791L9.84288 7.12278L10.3102 9.83735C10.3943 10.3282 9.87683 10.6937 9.44288 10.4661L6.99995 9.20152L4.55777 10.4832C4.12306 10.7109 3.60627 10.3452 3.69023 9.85451L4.15758 7.13994L2.18126 5.21828C1.82622 4.87313 2.02238 4.2707 2.51242 4.19981L5.24378 3.8026L6.4645 1.33244C6.68465 0.886483 7.31712 0.892024 7.5354 1.33206Z" stroke-width="2"/>
                </g>
            </svg>
        `;
    }
}

customElements.define("star-outline-icon", StarOutlineIcon);