require "rspec"
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara'
require 'require_all'

require_relative '../../pages/all_pages'

Selenium::WebDriver::Chrome::Service.driver_path="C:/Users/dchaly/chromedriver/chromedriver.exe"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, {:browser => :chrome})
end

Before do
  Capybara.current_driver = :selenium
end