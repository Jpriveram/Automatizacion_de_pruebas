When('I fill out the sign up form with unique credentials:') do |table|
  data = table.rows_hash
  unique_username = "#{data['Username']}_#{Time.now.to_i}_#{rand(1000)}"

  SignupPage.new.fill_form(unique_username, data['Password'])
end
