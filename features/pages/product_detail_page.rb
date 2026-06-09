class ProductDetailPage
  include Capybara::DSL

  TITLE_SELECTOR = 'h2.name'.freeze
  PRICE_SELECTOR = 'h3.price-container'.freeze
  DESCRIPTION_SELECTOR = '#more-information p'.freeze
  ADD_TO_CART_SELECTOR = 'a.btn.btn-success'.freeze

  def has_title?(product_name)
    page.has_css?(TITLE_SELECTOR, text: product_name)
  end

  def has_price?(product_price)
    page.has_css?(PRICE_SELECTOR, text: product_price)
  end

  def has_description?(description)
    page.has_css?(DESCRIPTION_SELECTOR, text: description)
  end

  def has_button?(button_name)
    page.has_selector?(ADD_TO_CART_SELECTOR, text: button_name)
  end
end
