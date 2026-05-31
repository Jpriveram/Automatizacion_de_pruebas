When('I open the detail page for product {string}') do |product_name|
  expect(page).to have_link(product_name)
  click_link(product_name)
end

Then('I should see the product detail with:') do |table|
  data = table.rows_hash

  expect(page).to have_css('h2.name', text: data['Name'])
  expect(page).to have_css('h3.price-container', text: data['Price'])
  expect(page).to have_css('#more-information p', text: data['Description'])
end

Then('I should see product detail title {string}') do |product_name|
  expect(page).to have_css('h2.name', text: product_name)
end

Then('I should see product detail price {string}') do |product_price|
  expect(page).to have_css('h3.price-container', text: product_price)
end

Then('I should see a product description containing {string}') do |expected_description|
  expect(page).to have_css('#more-information p', text: expected_description)
end

Then('I should see the {string} button on the product detail page') do |button_name|
  expect(page).to have_selector('a.btn.btn-success', text: button_name)
end
