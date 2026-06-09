begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
# require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'

Dir[File.join(File.dirname(__FILE__), '../pages/*.rb')].each { |file| require file }

# PTravel Settings
ENV['USER']="Pepazo"
ENV['PSW']="ILoveQA"

# Set the host the Capybara tests should be run against
Capybara.app_host = ENV["CAPYBARA_HOST"]

# Set the time (in seconds) Capybara should wait for elements to appear on the page
Capybara.default_max_wait_time = 15
Capybara.default_driver = :selenium
Capybara.app_host = "https://www.demoblaze.com"

class CapybaraDriverRegistrar
  # Register a Selenium driver for the given browser to run on localhost.
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      options = ::Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--log-level=3')
      options.add_argument('--silent')

      Capybara::Selenium::Driver.new(app, :browser => browser, options: options)
    end
  end
end

# Register various Selenium drivers
#CapybaraDriverRegistrar.register_selenium_driver(:internet_explorer)
#CapybaraDriverRegistrar.register_selenium_driver(:firefox)
CapybaraDriverRegistrar.register_selenium_driver(:chrome)
Capybara.run_server = false
#World(Capybara)
