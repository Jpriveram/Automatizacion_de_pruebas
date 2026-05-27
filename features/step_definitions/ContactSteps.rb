  Given('I browse to the Demoblaze homepage') do
    page.driver.browser.manage.window.maximize
    visit('/') 
    sleep 2 
  end
  #click Contact button on navbar
  When('I click the {string} button in the navigation bar') do |button_name|
    click_link(button_name)  
  end

  # Check if modal pops up 
  Then('I should see a modal with the title {string}') do |expected_title|
  puts "Modal title we are looking for: '#{expected_title}'"
  # Le agregamos visible: true para asegurar que espere la animación.
  expect(page).to have_css('.modal-title', text: expected_title, visible: true)
end

  #We fill the contact form 
  When('I fill out the contact form with the following details:') do |table|
    data = table.rows_hash
    fill_in 'recipient-email', with: data['Email']
    fill_in 'recipient-name', with: data['Name']
    fill_in 'message-text', with: data['Message']
  end

  #Click send 
  When('I click the {string} button') do |string|
    find('#exampleModal > div > div > div.modal-footer > button.btn.btn-primary').click
  end
  #Check alert
  Then('I should see a browser alert saying {string}') do |string|
    alert_text = page.accept_alert
    
    puts "TEST ONLY: Alert text: '#{alert_text}'"

    expect(alert_text).to eq(string)  
  end

  When('I click the {string} close icon on the modal') do |string|
  find('.modal-header button.close', visible: true).click
  end

  Then('the modal should no longer be visible') do
    expect(page).to have_no_css('#exampleModal > div > div',visible: true)
  end

When('I click the {string} button on the modal') do |string|
    sleep 0.5
    click_button(string)
  end
