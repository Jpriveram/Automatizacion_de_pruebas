When('I open the detail page for product {string}') do |product_name|
  home_page = HomePage.new

  expect(home_page.has_product?(product_name)).to be true
  home_page.open_product(product_name)
end

Then('I should see the product detail with:') do |table|
  data = table.rows_hash
  product_detail_page = ProductDetailPage.new

  expect(product_detail_page.has_title?(data['Name'])).to be true
  expect(product_detail_page.has_price?(data['Price'])).to be true
  expect(product_detail_page.has_description?(data['Description'])).to be true
end

Then('I should see product detail title {string}') do |product_name|
  expect(ProductDetailPage.new.has_title?(product_name)).to be true
end

Then('I should see product detail price {string}') do |product_price|
  expect(ProductDetailPage.new.has_price?(product_price)).to be true
end

Then('I should see a product description containing {string}') do |expected_description|
  expect(ProductDetailPage.new.has_description?(expected_description)).to be true
end

Then('I should see the {string} button on the product detail page') do |button_name|
  expect(ProductDetailPage.new.has_button?(button_name)).to be true
end
