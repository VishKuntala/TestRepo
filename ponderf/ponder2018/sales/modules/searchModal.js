const displayPSAData = (psaData) => {
    document.getElementById('displayPSA').innerHTML = 'PSA: ' + psaData.ZIP_CO_PSA;
    document.getElementById('displayWirelessScore').innerHTML = 'Wireless Score: ' + psaData.WIRELESS_SCORE_TEXT;
    document.getElementById('displayFiberAvailable').innerHTML = 'Fiber Available: ' + psaData.FIBER_AVAILABLE;
    document.getElementById('displayFiberCustomers').innerHTML = 'Fiber Customers: ' + psaData.FIBER_CUSTOMERS;
    document.getElementById('displayFiberOpportunity').innerHTML = 'Fiber Opportunity: ' + psaData.FIBER_OPPORTUNITY;
    document.getElementById('displayCopperUpgrade').innerHTML = 'Copper Upgrade: ' + psaData.COPPER_UPGRADE;
};

const displayFuturePSAData = (psaData) => {
    document.getElementById('displayFuturePSA').innerHTML = 'PSA: ' + psaData.ZIP_CO_PSA;
    document.getElementById('displayFuturePSAWirelessScore').innerHTML = 'Wireless Score: ' + psaData.WIRELESS_SCORE_TEXT;
    document.getElementById('displayFuturePSAFiberAvailableCount').innerHTML = 'Future Fiber Opportunity: ' + psaData.FUTURE_FIBER_OPPORTUNITY;
    document.getElementById('displayFutureGreen30DayDate').innerHTML = 'T-30 File Date: ' + psaData.GRN_30DAY_DT;
};

export { displayPSAData, displayFuturePSAData };