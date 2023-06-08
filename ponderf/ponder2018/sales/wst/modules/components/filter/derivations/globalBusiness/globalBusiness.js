import $ from "jquery";
import * as R from 'ramda';


const globalBusiness = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/${$('#hdnAppName').val()}/globalBusinessFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default globalBusiness;



