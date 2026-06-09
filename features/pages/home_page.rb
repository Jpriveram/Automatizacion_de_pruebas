class HomePage
  include Capybara::DSL

  PRODUCT_DETAIL_PRODUCT = 'Samsung galaxy s6'.freeze

  def go_to_home
    click_link('Home')
  end

  def has_product?(product_name)
    page.has_link?(product_name)
  end

  def open_product(product_name)
    click_link(product_name)
  end

  def open_default_product_detail
    open_product(PRODUCT_DETAIL_PRODUCT)
  end

  def go_to_cart
    click_link('Cart')
  end

  def cart_loaded?
    page.has_content?('Products')
  end
end
