When('I navigate to the {string} page for footer validation') do |page_name|
  home_page = HomePage.new

  case page_name
  when 'Home'
    home_page.go_to_home
  when 'Product detail'
    expect(home_page.has_product?(HomePage::PRODUCT_DETAIL_PRODUCT)).to be true
    home_page.open_default_product_detail
    expect(ProductDetailPage.new.has_title?(HomePage::PRODUCT_DETAIL_PRODUCT)).to be true
  when 'Cart'
    home_page.go_to_cart
    expect(home_page.cart_loaded?).to be true
  else
    raise "Unknown page for footer validation: #{page_name}"
  end
end

Then('I should see the Demoblaze footer with the following sections:') do |table|
  footer = FooterComponent.new

  expect(footer.visible?).to be true
  table.hashes.each do |row|
    expect(footer.has_text?(row['Section'])).to be true
    expect(footer.has_text?(row['Expected text'])).to be true
  end
end
