Then('I should not see the text {string} in the top right corner') do |expected_text|
expect(page).to have_no_content(expected_text)
end

Then('I should see the {string} button in the navigation bar') do |expected_text|
expect(page).to have_content(expected_text)
end