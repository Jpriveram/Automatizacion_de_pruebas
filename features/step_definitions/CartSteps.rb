Then('I should see the product name {string} on the product page') do |product_name|
  expect(page).to have_css('h2.name', text: product_name)
end

Then('I should see the product price and description on the product page') do
  expect(page).to have_css('h3.price-container')
  expect(page).to have_css('#more-information p')
end

When('I add the product to the cart') do
  click_link('Add to cart')
  sleep 1
end

When('I accept the browser alert saying {string}') do |expected_text|
  alert_text = page.accept_alert

  puts "TEST ONLY: Alert text: '#{alert_text}'"
  expect(alert_text.strip.chomp('.')).to eq(expected_text.strip.chomp('.'))
  sleep 1
end

When('I go to the cart') do
  click_link('Cart')
  sleep 2
end

When('I start the checkout') do
  click_button('Place Order')
  sleep 1
end

When('I confirm the purchase') do
  click_button('Purchase')
  sleep 1
end

When('I accept the purchase confirmation') do
  click_button('OK')
  sleep 1
end

When('I delete the product {string} from the cart') do |product_name|
  within('tr', text: product_name) do
    click_link('Delete')
  end
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

When('I fill out the purchase form with the following details:') do |table|
  data = table.rows_hash
  find(:xpath, '/html/body/div[3]/div/div/div[2]/form/div[1]/input').set(data['Name'])
  find(:xpath, '/html/body/div[3]/div/div/div[2]/form/div[2]/input').set(data['Country'])
  find(:xpath, '/html/body/div[3]/div/div/div[2]/form/div[3]/input').set(data['City'])
  find(:xpath, '/html/body/div[3]/div/div/div[2]/form/div[4]/input').set(data['Credit card'])
  find(:xpath, '/html/body/div[3]/div/div/div[2]/form/div[5]/input').set(data['Month'])
  find(:xpath, '/html/body/div[3]/div/div/div[2]/form/div[6]/input').set(data['Year'])
end

Then('I should see the confirmation modal {string}') do |expected_text|
  expect(page).to have_css('.sweet-alert h2', text: expected_text)
end

Then('I should be redirected back to the Demoblaze homepage') do
  sleep 1
  expect(current_url).to include('index')
  expect(page).to have_css('#navbarExample')
end
