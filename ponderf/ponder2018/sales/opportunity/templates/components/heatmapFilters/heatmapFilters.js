import { html } from "lit-element";
import { styleMap } from 'lit-html/directives/style-map.js';

import './heatmapFilters.css';
const template = ({ handleFilterClick, filters, summaryData, instance }) => {
    const { groupCount, opportunityCount, groupBy } = summaryData;

    const filterButtons = filters?.map(({ heading, color, active }, index) => {
        const styles = { backgroundColor: `${color}90`, "border-color": color };
        return html`<button class='ui button ${active ? 'active': ''}' style=${styleMap(styles)} @click="${(event) => handleFilterClick({index, event, instance})}">
                <span class='filter-btn--sub'>${heading}</span>
                <span class='filter-btn--sub'>${Number(groupCount[index]).toLocaleString()} ${groupBy}</span>
                <span class='filter-btn--sub'>${Number(opportunityCount[index].toString().replace(/,/,"")).toLocaleString()} Opportunities</span>
            </button>`;
    });

    return html`
        <div class="heatmap-filters ui stackable buttons">
            ${filterButtons}
        </div>
    `;
};

export default template;
