When('I click on the product {string}') do |product_name|
  click_link(product_name)
  sleep 2
end

Then('I should see the product name {string} on the product page') do |product_name|
  expect(page).to have_css('h2.name', text: product_name)
end

Then('I should see the product price and description on the product page') do
  expect(page).to have_css('h3.price-container')
  expect(page).to have_css('#more-information p')
end

When('I tap the {string} button') do |button_name|
  click_link(button_name) rescue click_button(button_name)
  sleep 1
end

When('I accept the browser alert saying {string}') do |expected_text|
  alert_text = page.accept_alert
  puts "TEST ONLY: Alert text: '#{alert_text}'"
  expect(alert_text.strip.chomp('.')).to eq(expected_text.strip.chomp('.'))
  sleep 1
end

When('I go to the Cart') do
  find('#cartur').click
  sleep 2
end

When('I delete the product {string} from the cart') do |product_name|
  row = find('#tbodyid tr', text: product_name)
  row.find('a', text: 'Delete').click
  sleep 2
end

Then('the cart table should contain a product') do
  expect(page).to have_css('#tbodyid tr')
end

Then('the cart table should contain the product {string}') do |product_name|
  expect(page).to have_css('#tbodyid tr', text: product_name)
end

Then('the cart table should be empty') do
  expect(page).to have_no_css('#tbodyid tr')
end

Then('I should see the total amount is greater than zero') do
  total_text = find('#totalp').text.strip
  total = total_text.gsub(/[^0-9]/, '').to_i
  puts "Cart total: #{total_text}"
  expect(total).to be > 0
end

When('I note the price shown on the product page') do
  price_text = find('h3.price-container').text.strip
  @product_price = price_text.gsub(/[^0-9]/, '').to_i
  puts "Product price: #{@product_price}"
  expect(@product_price).to be > 0
end

Then('the total amount to pay should match the product price') do
  total_text = find('#totalp').text.strip
  total = total_text.gsub(/[^0-9]/, '').to_i
  puts "Cart total: #{total} | Product price: #{@product_price}"
  expect(total).to eq(@product_price)
end

When('I add the displayed product price to the expected total') do
  price = find('h3.price-container').text.strip.gsub(/[^0-9]/, '').to_i
  @expected_total = (@expected_total || 0) + price
  puts "Added product price: #{price} | Expected total so far: #{@expected_total}"
end

Then('the total amount to pay should match the expected total') do
  total_text = find('#totalp').text.strip
  total = total_text.gsub(/[^0-9]/, '').to_i
  puts "Cart total: #{total} | Expected total: #{@expected_total}"
  expect(total).to eq(@expected_total)
end

When('I fill out the purchase form with the following details:') do |table|
  field_ids = {
    'Name'        => 'name',
    'Country'     => 'country',
    'City'        => 'city',
    'Credit card' => 'card',
    'Month'       => 'month',
    'Year'        => 'year'
  }
  table.rows_hash.each do |field, value|
    fill_in field_ids[field], with: value
  end
end

Then('I should see the confirmation modal {string}') do |expected_text|
  expect(page).to have_css('.sweet-alert h2', text: expected_text)
end

Then('I should see the purchase summary contains the name {string}') do |expected_name|
  expect(page).to have_css('.sweet-alert p', text: expected_name)
end

When('I click the {string} button on the confirmation modal') do |_button_name|
  find('.sweet-alert button.confirm').click
  sleep 1
end

Then('I should be redirected back to the Demoblaze homepage') do
  sleep 1
  expect(current_url).to include('index')
  expect(page).to have_css('#navbarExample')
end