class FooterComponent
  include Capybara::DSL

  FOOTER_SELECTOR = '#footc'.freeze

  def visible?
    page.has_css?(FOOTER_SELECTOR, visible: true)
  end

  def has_text?(text)
    footer.has_content?(text)
  end

  private

  def footer
    find(FOOTER_SELECTOR, visible: true)
  end
end
