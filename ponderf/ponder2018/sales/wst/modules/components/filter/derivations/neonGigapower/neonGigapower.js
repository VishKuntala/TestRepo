import $ from "jquery";
import * as R from 'ramda';


const neonGigapower =  async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/${$('#hdnAppName').val()}/neonGigapowerFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default neonGigapower;

