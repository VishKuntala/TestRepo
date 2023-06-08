import $ from "jquery";
import * as R from 'ramda';


const omni = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/${$('#hdnAppName').val()}/omniFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default omni;








