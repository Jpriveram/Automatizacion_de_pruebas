When('I click the {string} category in the sidebar') do |category_name|
  click_link(category_name)
end

Then('the product grid should display exactly {int} items') do |expected_count|
  
  expect(page).to have_css('.card', count: expected_count)
  
  puts "TEST ONLY: Se encontraron exactamente #{expected_count} elementos."
end