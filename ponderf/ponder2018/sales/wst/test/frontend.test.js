const timeout = process.env.SLOWMO ? 30000 : 10000;

beforeAll(async () => {
    await page.goto(URL, { waitUntil: 'domcontentloaded' });
});

describe('Filter Component', () => {
    test('SV Search should trigger results when a minimum of 3 characters are typed', async () => {
        const resultsSelector = '.result';
        let resultsCount = 0;
        await page.type('.prompt', 'KO');
        resultsCount = await page.$$eval(resultsSelector, results => results.length);
        expect(resultsCount).toEqual(0);
        await page.screenshot({ path: 'test/screenshots/filter-2characters.png' });
        await page.type('.prompt', 'B');
        await page.waitForSelector(resultsSelector);
        const results = await page.$$(resultsSelector);
        expect(results.length).toBeGreaterThan(0);
        page.emulateMediaType('screen');
        await page.pdf({ path: 'test/screenshots/filter-3characters.pdf' });
        const selectedText = await results[0].evaluate(el => el.textContent);
        
    }, timeout);
});