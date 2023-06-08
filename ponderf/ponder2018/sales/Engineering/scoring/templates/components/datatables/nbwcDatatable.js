const html = ({ id, headers }) => `
  <thead>
<tr>
${headers.map(header => `<th class="center aligned">${header}</th>`)}
</tr>
  </thead>`;

export { html };