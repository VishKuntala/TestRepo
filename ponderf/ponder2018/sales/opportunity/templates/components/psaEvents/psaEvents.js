import { html } from "lit-element";
import "./psaEvents.css";

const template = ({psaEventsData }) => {
    // psa events
    const psaEventsList = psaEventsData.map(({ actual_fiber_migrations, actual_new_fiber_sales, event_activity, event_id, event_name, fiber_channels, forecast_fiber_migrations, forecast_new_fiber_sales, psa, start_dt, status }) => {
        return html`
                <details class="ui accordion">
                  <summary class="title">
                    <i class="dropdown icon"></i> <b>Start Date: ${start_dt} - ${event_activity}</b>
                  </summary>
                  <div class="content">
                    <ul>
                        <li>Id - ${event_id}</li>
                        <li>Name - ${event_name}</li>
                        <li>Actual Fiber Migrations - ${actual_fiber_migrations}</li>
                        <li>Actual New Fiber Sales - ${actual_new_fiber_sales}</li>
                        <li>Event Activity - ${event_activity}</li>
                        <li>Fiber Channels - ${fiber_channels}</li>
                        <li>Forecast Fiber Migrations - ${forecast_fiber_migrations}</li>
                        <li>Forecast New Fiber Sales - ${forecast_new_fiber_sales}</li>
                        <li>PSA - ${psa}</li>
                        <li>Start Date - ${start_dt}</li>
                        <li>Status - ${status}</li>
                    </ul>
                  </div>
                </details>`;
    });
    const psaEventsHtml = html`${psaEventsList}`;
    return html`
        <div class="ui psaEvents modal">
          <i class="close icon"></i>
          <div class="content">
            <h2><u>PSA Events</u></h2>
            ${psaEventsHtml}
            </br>
            <p>Go to <a href="https://inmotion.att.com" target="_blank">inMotion Tool</a> to Add or View Event Details.</p>
          </div>
          <div class="actions">
                <div class="ui positive green button">OK</div>
          </div>
        </div>
    `;
};

export default template;
