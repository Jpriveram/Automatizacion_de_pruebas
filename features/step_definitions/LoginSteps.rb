When('I fill out the login form with the following credentials:') do |table|
 data = table.rows_hash
  fill_in 'loginusername', with: data['Username']
  fill_in 'loginpassword', with: data['Password']
end

Then('I should see the text {string} in the top right corner') do |string|
  expect(page).to have_selector('#nameofuser', text: string)
end