import { html } from 'lit-element';

const template = ({ id, cards, removeCard, removeAllCards, compareCards }) => html`
<div class="ui ponderCards message transition hidden">
    <i @click="${removeAllCards}" class="close icon"></i>
    <div id="${id}" class="ui cards">
        ${ cards.map(card => html`<div class="ui card pondercard">
        <div class="content">
          <div class="description">
            <i data-card-id="${card.id}" @click="${removeCard}" class="right floated close icon"></i>
            <strong>${card.title}</strong>
          </div>
        </div>
        `)}
        <div class="ui grid middle aligned">
            <div class="row">
                <div class="column">
                    <button @click="${compareCards}" id="btnCompare" class="ui blue right floated disabled button">Compare</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="ui compare modal">
  <i class="close icon"></i>
  <div class="header">
    Compare Businesses
  </div>
  <div class="image content">
    <div class="ui sixteen wide container equal width grid">
        <div class="equal width row">
            <div class="center aligned column"><strong>test</strong></div>
            <div class="center aligned column"></div>
            <div class="center aligned column"><strong>test1</strong></div>
        </div>
        <div class="equal width row">
            <div class="center aligned column"><strong>test</strong></div>
            <div class="center aligned column">Locations</div>
            <div class="center aligned column"><strong>test1</strong></div>
        </div>
        <div class="equal width row">
            <div class="center aligned column"><strong>test</strong></div>
            <div class="center aligned column">Avg. Coverage Score</div>
            <div class="center aligned column"><strong>test1</strong></div>
        </div>
    </div>
  </div>
  <div class="actions">
    <div class="ui cancel orange icon button">
      No
        <i class="times icon"></i>
    </div>
    <div class="ui positive right labeled icon button">
      Yes
      <i class="checkmark icon"></i>
    </div>
  </div>
</div>s
`;

export default template;                            