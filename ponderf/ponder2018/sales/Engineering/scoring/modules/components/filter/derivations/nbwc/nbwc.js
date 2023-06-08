import $ from "jquery";
import * as R from 'ramda';


const nbwc = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/nbwcFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default nbwc;







