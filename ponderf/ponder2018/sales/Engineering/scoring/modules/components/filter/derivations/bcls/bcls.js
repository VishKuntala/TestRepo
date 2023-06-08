import $ from "jquery";
import * as R from 'ramda';


const bcls = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/bclsFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default bcls;



