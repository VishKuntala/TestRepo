const html = ({ id, headers }) => {
    return `
  <thead>
<tr>
${headers.map(header => `<th class="center aligned">${header}</th>`)}
</tr>
  </thead>`;
}

export { html };