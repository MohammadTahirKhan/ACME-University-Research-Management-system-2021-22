# Configure coverage logging
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

# Ensure we use the test database
ENV["APP_ENV"] = "acme_database"

# load the app
require_relative "../app"

# Configure Capybara
require "capybara/rspec"
Capybara.app = Sinatra::Application

# Configure RSpec
def app
  Sinatra::Application
end
RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
end

def login(username, password, type)
  visit 'login'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Submit'
end

def create_account(username, email, institution, password)
  visit "/create_account"
  fill_in "username", with: username
  fill_in "email", with: email
  fill_in "institution", with: institution
  fill_in "password", with: password
  click_button "Submit"
end