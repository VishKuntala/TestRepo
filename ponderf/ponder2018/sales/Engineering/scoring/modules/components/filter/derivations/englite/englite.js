import $ from "jquery";
import * as R from 'ramda';


const englite = async ({ adminUser, instance }) => {


    const html = async () => {
        const mod = await import(`../../../../../templates/components/filters/engliteFilter.js`);
        return mod.html;
    }

    return {
        html
    }
}

export default englite;



