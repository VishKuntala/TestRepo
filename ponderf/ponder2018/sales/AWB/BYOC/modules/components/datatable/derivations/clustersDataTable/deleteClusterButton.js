
const html = ({ adminUser, id }) => `<div class="center aligned"><button data-show-condition='{"admin_user": "${adminUser}"}' data-publish-attr="deleteCluster" class="negative mini ui icon button">
<i data-publish-attr="deleteCluster" class="trash alternate circle icon"></i>
</button></div>`;

export { html };                            