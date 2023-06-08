import $ from "jquery";
import * as R from 'ramda';


const fiveg = ({ adminUser, instance }) => {

    const initSubscriptions = () => {
        instance.stateManager.subscribe("fivegLegend",
            async d => {
                if (d) {
                    instance.legends = d;
                    instance.requestUpdate();
                }

            });
    }

    return {
        initSubscriptions
    }


}

export default fiveg;