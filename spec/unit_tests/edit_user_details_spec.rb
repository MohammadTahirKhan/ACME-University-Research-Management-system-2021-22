require "rspec"
require "rack/test"

require_relative '../../app'

RSpec.describe "testing if all the pages are displayed" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "edit user details" do
    it "user can edit personal user details from profile page" do
        (DB[:users].where(username: "Test26_Username")).delete 
        visit "/create_account"
        fill_in "username", with: "Test26_Username"
        fill_in "email", with: "Test26_Email"
        fill_in "password", with: "Test25_Password"
        click_button "Submit"

        visit "/login"
        fill_in "username", with: "Test26_Username"
        fill_in "password", with: "Test25_Password"

        click_button "Submit"
        visit "/profile"
        click_link "Edit"
        fill_in "password", with: "abcde"
        click_button "Submit"

        visit "/login"
        fill_in "username", with: "Test26_Username"
        fill_in "password", with: "abcde"

        click_button "Submit"
        expect(page).to have_content "Welcome"
        
        (DB[:users].where(username: "Test26_Username")).delete 
    end

    
  end
end

        