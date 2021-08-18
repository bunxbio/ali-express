pages << {
	url: 'https://www.aliexpress.com/category/100003109/women-clothing.html',
	page_type: 'listings',
	fetch_type: 'browser',
	force_fetch: true,
	method: 'GET',
	headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
	driver: {
        code: "await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000); await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);"
    },
	vars: {
		page_num: 1
	}
}