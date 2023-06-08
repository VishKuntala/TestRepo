import { html } from 'lit-element';
import './appHeader.css';

const template = ({ rootUrl }) => html`
<nav class="container">
    <div class='nav-items'>
        <div class='left-links'>
            <div class='nav-logo'>
                <img src="assets/images/att_logo_white.png" />
                <span>PONDER</span>
                <div>&nbsp- Direct</div>
            </div>
        </div>
        <div class='right-links'>
        </div>
    </div>
</nav>



`;

export default template;                            