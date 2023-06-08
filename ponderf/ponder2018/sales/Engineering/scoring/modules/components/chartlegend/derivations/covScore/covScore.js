import $ from "jquery";
import * as R from 'ramda';


const covScore = ({ adminUser, instance }) => {

    const initSubscriptions = () => {
        instance.stateManager.subscribe("covScoreLegend",
            async d => {
                if (d) {
                    instance.legends = d;
                    instance.requestUpdate();
                }

            });
    }

    return {
        
    }


}

export default covScore;