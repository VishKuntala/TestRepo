import $ from "jquery";
import * as R from 'ramda';


const bclsv2 =  async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/${$('#hdnAppName').val()}/bclsv2Filter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default bclsv2;

