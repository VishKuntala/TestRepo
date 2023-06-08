const html = ({ id, headers, config }) =>  `
  <thead>
<tr>
${config.dataTableHeaders.split(',').map(header => `<th class="center aligned">${header}</th>`)}
</tr>
  </thead>`;


export { html };                            