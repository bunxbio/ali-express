driver_code = "await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);"

nokogiri = Nokogiri.HTML(content)

products = nokogiri.css('.JIIxO ._1OUGS')

products.each do |product|
	a_element = product.at_css('.awV9E')
	url = "https://www.aliexpress.com#{a_element['href'].to_s.split('?').first}"

	pages << {
		url: url,
		page_type: 'products',
		fetch_type: 'browser',
		method: 'GET',
		force_fetch: true,
		vars: {
			page_num: page['vars']['page_num'],
			category: "Women's clothing",
			url: url
		}
	}
end


current_page_num = page['vars']['page_num']

if products
	next_page = "https://www.aliexpress.com/category/100003109/women-clothing.html?trafficChannel=main&catName=women-clothing&CatId=100003109&ltype=wholesale&SortType=default&page=#{current_page_num + 1}"

	pages << {
		url: next_page,
		page_type: 'listings',
		fetch_type: 'browser',
		method: 'GET',
		force_fetch: true,
		vars: {
			page_num: current_page_num+1
		},
		headers: {
			"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
		},
		driver: {
			code: driver_code
		}
	}
end