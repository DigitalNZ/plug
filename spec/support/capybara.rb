require 'capybara'
require 'selenium-webdriver'

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.raise_server_errors = false
