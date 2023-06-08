

const html = ({ adminUser, id }) => `<div class="center aligned">
<div class="ui  icon buttons">
    <button data-publish-attr="invokeMap" data-show-condition='{"is_processed":1}' class="green ui mini icon button">
        <i data-publish-attr="invokeMap" class=" alternate circle map marked icon"></i> Map
    </button>
    <button data-publish-attr="getClusterDetails" data-show-condition='{"is_processed":1}' class="blue ui mini icon button">
        <i data-publish-attr="getClusterDetails" class="arrow alternate circle down icon"></i> Download
    </button>
    <button data-publish-attr="rerunCluster" data-show-condition='{"is_processed":1, "admin_user": "${adminUser}"}' class="teal ui mini icon button">
        <i data-publish-attr="rerunCluster" class=" alternate circle retweet icon"></i> Rerun
    </button>    
</div></div>`;

export { html };                            