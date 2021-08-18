nokogiri = Nokogiri.HTML(content)

products = nokogiri.css('.JIIxO ._1OUGS')
product_ids = []

products.each do |product|
	a_element = product.at_css('.awV9E')
	url = URI.join('https://www.aliexpress.com', a_element['href']).to_s.split('?').first

	product_ids << product.css('a').attr('href').match(/\/item\/([0-9]+)\//)[1]

	pages << {
		url: url,
		page_type: 'products',
		fetch_type: 'browser',
		force_fetch: true,
		vars: {
			page_num: page['vars']['page_num']
			category: "Women's clothing",
			url: url
		}
	}
end

url = "https://www.aliexpress.com/glosearch/api/product?trafficChannel=main&catName=women-clothing&CatId=100003109&ltype=wholesale&SortType=default&page=2&origin=y&pv_feature=#{product_ids.join(',')}"
pages << {
	url: url,
	page_type: 'listings_json',
	force_fetch: true,
	method: 'GET',
	headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
	vars: {
		page_num: 2
	}