import $ from "jquery";
import * as R from 'ramda';


const nationalLUs = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/nationalLUsFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default nationalLUs;







