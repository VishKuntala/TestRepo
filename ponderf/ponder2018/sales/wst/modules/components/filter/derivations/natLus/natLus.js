import $ from "jquery";
import * as R from 'ramda';


const natLus = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/${$('#hdnAppName').val()}/natLusFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default natLus;




