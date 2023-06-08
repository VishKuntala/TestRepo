import $ from "jquery";
import * as R from 'ramda';

const opportunity = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/opportunityFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default opportunity;



