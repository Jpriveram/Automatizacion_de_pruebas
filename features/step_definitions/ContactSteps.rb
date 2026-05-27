Given('I browse to the Demoblaze homepage') do
  page.driver.browser.manage.window.maximize
  visit('/')
  sleep 2
end

When('I click the {string} button in the navigation bar') do |button_name|
  click_link(button_name)
end

Then('I should see a modal with the title {string}') do |expected_title|
  modal_selectors = {
    'New message' => '#exampleModal',
    'Log in' => '#logInModal',
    'Sign up' => '#signInModal'
  }
  @active_modal = modal_selectors.fetch(expected_title, '.modal')

  puts "Modal title we are looking for: '#{expected_title}'"
  expect(page).to have_css("#{@active_modal} .modal-title", text: expected_title, visible: true)
end

When('I fill out the contact form with the following details:') do |table|
  data = table.rows_hash
  fill_in 'recipient-email', with: data['Email']
  fill_in 'recipient-name', with: data['Name']
  fill_in 'message-text', with: data['Message']
end

When('I click the {string} button') do |button_name|
  find(@active_modal || '#exampleModal', visible: true).click_button(button_name)
end

Then('I should see a browser alert saying {string}') do |expected_text|
  alert_text = page.accept_alert

  puts "TEST ONLY: Alert text: '#{alert_text}'"
  expect(alert_text).to eq(expected_text)
end

When('I click the {string} close icon on the modal') do |_icon_name|
  sleep 0.5
  find("#{@active_modal || '.modal'} .modal-header button.close", visible: true).click
end

Then('the modal should no longer be visible') do
  expect(page).to have_no_css(@active_modal || '#exampleModal', visible: true)
end

When('I click the {string} button on the modal') do |button_name|
  sleep 0.5
  find(@active_modal || '.modal', visible: true).click_button(button_name)
end
