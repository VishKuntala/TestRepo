import $ from "jquery";
import * as R from 'ramda';


const byoc = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/${$('#hdnAppName').val()}/byocFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default byoc;



