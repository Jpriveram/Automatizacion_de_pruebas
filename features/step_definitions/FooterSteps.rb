When('I navigate to the {string} page for footer validation') do |page_name|
  case page_name
  when 'Home'
    click_link('Home')
  when 'Product detail'
    expect(page).to have_link('Samsung galaxy s6')
    click_link('Samsung galaxy s6')
    expect(page).to have_css('h2.name', text: 'Samsung galaxy s6')
  when 'Cart'
    click_link('Cart')
    expect(page).to have_content('Products')
  else
    raise "Unknown page for footer validation: #{page_name}"
  end
end

Then('I should see the Demoblaze footer with the following sections:') do |table|
  expect(page).to have_css('#footc', visible: true)

  footer = find('#footc', visible: true)
  table.hashes.each do |row|
    expect(footer).to have_content(row['Section'])
    expect(footer).to have_content(row['Expected text'])
  end
end
