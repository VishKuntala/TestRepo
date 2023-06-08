import constants from "./referenceValueConstants.js";

const {
  ATT_RETAIL_STORE,
  AUTHORIZED_RESELLER_STORE,
  PSA_LOICATIONS,
  TOP_PSA_LOCATIONS,
  HIGH_OPPORTUNITY_MDUS,
  ATT_FIBER_CUSTOMER,
  ATT_FIBER_PROSPECT,
  MDU_ALL_ATT_FIBER_CUSTOMERS,
  MDU_WITH_ATT_FIBER_PROSPECTS,
  COLOR_BY_CATEGORY_MAPPING,
} = constants;

const getUpdatedSpanElement = (category) => {
  const color = COLOR_BY_CATEGORY_MAPPING[category];
  if (color) {
    switch (category) {
      case ATT_RETAIL_STORE:
      case AUTHORIZED_RESELLER_STORE:
          return `<div class="store-label"><i style="color:${color}"></i>${category}</div>`;      
      case PSA_LOICATIONS:
      case TOP_PSA_LOCATIONS:
        return `<div class="psa-label"><i style="color:${color}"></i>${category}</div>`;
      case HIGH_OPPORTUNITY_MDUS:
        return `<div class="mdus-label"><i style="color:${color}"></i>${category}</div>`;
      case ATT_FIBER_CUSTOMER:
      case ATT_FIBER_PROSPECT:
        return `<div class="store-label"><i style="color:${color}"></i>${category}</div>`;
      case MDU_ALL_ATT_FIBER_CUSTOMERS:
      case MDU_WITH_ATT_FIBER_PROSPECTS:
            return `<div class="all-fiber-customers-label"><i style="color:${color}"></i>${category}</div>`;
        case "3T20 Acquire Mobility White Space":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "3T20 Acquire Mobility Port Outs":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "Acquire Mobility Whitespace":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Top ARPU":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Top TBR":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Top Integrated subs":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Top Data subs":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Top Voice subs":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Top Potential CRU":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility 3G Shutdown":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Acquire Mobility existing Wireline":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Acquire Mobility Port Outs":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Acquire Mobility New Logo":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "1T21 Grow Mobility Post COVID":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
        case "Mid Market Locations":
            return `<div class="campaign-label"><i style="color:${color}"></i>${category}</div>`;
      default:
        return null;
    }
  }
  return null;
};

const updateOverlaysLabel = () => {
  $(".leaflet-control-layers-overlays")
    .find("label")
    .each(function () {
      const text = $(this).find("div").find("span").text().trim();
      const updatedSpanElement = getUpdatedSpanElement(text);
      if (updatedSpanElement) {
        $(this).find("div").find("span").replaceWith(updatedSpanElement);
      }
    });
};

export { updateOverlaysLabel };
