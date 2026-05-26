  Given('I browse to the Demoblaze homepage') do
    page.driver.browser.manage.window.maximize
    visit('/') 
    sleep 2 
  end
  #click Contact button on navbar
  When('I click the {string} button in the navigation bar') do |string|
    find('#navbarExample > ul > li:nth-child(2) > a').click
  end
  #Check if modal pops up
  Then('I should see a modal with the title {string}') do |string|
    puts "Modal title: '#{string}'"

    expect(page).to have_selector('#exampleModalLabel', text: string)
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
    actual_alert_text = page.accept_alert
    
    puts "TEST ONLY: Alert text: '#{actual_alert_text}'"

    expect(actual_alert_text).to eq(string)  
  end

  When('I click the {string} close icon on the modal') do |string|
    sleep 0.5
    find('#exampleModal > div > div > div.modal-header > button').click
  end

Then('the modal should no longer be visible') do
    expect(page).to have_no_css('#exampleModal > div > div',visible: true)
  end

When('I click the {string} button on the modal') do |string|
    sleep 0.5
    find('#exampleModal > div > div > div.modal-footer > button.btn.btn-secondary').click
  end
