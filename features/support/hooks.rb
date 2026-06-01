
After do
    Capybara.reset_sessions!
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

