nokogiri = Nokogiri.HTML(content)

product = {}

product['url'] = page['vars']['url']
product['category'] = page['vars']['category']
product['title'] = nokogiri.at_css('.product-title-text').text.strip
product['image_url'] = nokogiri.at_css('.image-view-magnifier-wrap img')['src']

price_container = nokogiri.css('.product-price')
if price_container
	product['current_price'] = price_container.at_css('.product-price-current span').text
	product['discount'] = price_container.at_css('span.product-price-mark').text
	if product['discount']
		product['original_price'] = price_container.at_css('.product-price-original .product-price-del span').text
#	else
#		product['original_price'] = product['current_price']
	end
end

skus_element = nokogiri.css('.product-quantity-tip')
if skus_element
	skus = skus_element.at_css('span span').text
	product['skus'] = skus
end

sizes_element = nokogiri.css('ul.sku-property-list')
if sizes_element
	sizes = sizes_element.css('div.sku-property-text').collect {|i| i.text.strip}
	product['sizes'] = sizes
end

product['rating'] = nokogiri.css('div.positive-fdbk')[0].text

product['orders_count'] = nokogiri.at_css('span.product-reviewer-sold').text.strip.split(' ').first.to_i

return_element = nokogiri.css('div.buyer-pretection-context')
if return_element
	product['return_policy'] = return_element.text
end

product['_collection'] = 'products'

outputs << product