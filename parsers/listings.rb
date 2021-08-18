nokogiri = Nokogiri.HTML(content)

products = nokogiri.css('.JIIxO ._1OUGS')

products.each do |product|
	url = product.at_css('a._9tla3')['href'].to_s
	url = 'https://aliexpress.com' + url.split('?').first
	pages << {
		url: url,
		page_type: 'products',
		fetch_type: 'browser',
		force_fetch: true,
		vars: {
			category: page['vars']['category'],
			url: url
		}
	}
end

pagination_links = nokogiri.css('.next-pagination-list button')

pagination_links.each do |link|
	val = link.text
	if val.to_i < 11
		url = 'https://www.aliexpress.com/category/100003109/women-clothing.html?page=' + val.to_s
		pages << {
			url: url,
			page_type: 'listings',
			fetch_type: 'browser',
			force_fetch: true,
			method: 'GET',
			headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
			vars: {
				category: "Women's clothing"
			}
		}
	end
end