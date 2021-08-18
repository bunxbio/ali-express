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