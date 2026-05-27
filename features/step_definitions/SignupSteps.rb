When('I fill out the sign up form with unique credentials:') do |table|
  data = table.rows_hash
  unique_username = "#{data['Username']}_#{Time.now.to_i}_#{rand(1000)}"

  fill_in 'sign-username', with: unique_username
  fill_in 'sign-password', with: data['Password']
end
