require "capybara"
require "capybara/cucumber"
require "faker"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    #Capybara.default_max_wait_time = 10 # implicit timeout
end