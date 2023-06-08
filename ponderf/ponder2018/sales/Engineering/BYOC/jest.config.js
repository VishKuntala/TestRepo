module.exports = {
    preset: "jest-puppeteer",
    globals: {
        URL: "http://127.0.0.1:8080/MidMarket/MidMarket.aspx"
    },
    testMatch: [
        "**/test/**/*.test.js"
    ],
    verbose: true
}