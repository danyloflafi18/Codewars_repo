require "rspec"
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara'
require 'require_all'

require_relative '../../pages/all_pages'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
Selenium::WebDriver.for :chrome, options: options

# Chrome non-headless driver
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Chrome headless driver
Capybara.register_driver :headless_chrome do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: 'ALL' })
  opts = Selenium::WebDriver::Chrome::Options.new

  chrome_args = %w[--headless]
  chrome_args.each { |arg| opts.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts, desired_capabilities: caps)
end

# Switch between :chrome / :headless_chrome to see tests run in chrome
case ENV['HEADLESS']
when 'true', 1, nil
  Capybara.javascript_driver = :headless_chrome
else
  Capybara.javascript_driver = :selenium
end

Before do
  Capybara.current_driver = :headless_chrome
end