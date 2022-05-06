require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Supend/restore" do
    context "suspend" do
      it "admin can suspend users" do
        visit "/create_account"
        fill_in "username", with: "Test25_Username"
        fill_in "email", with: "Test25_Email"
        fill_in "password", with: "Test25_Password"
        click_button "Submit"
        visit "/admin"
        fill_in "user_search1", with: "Test25_Username"
        click_button "Apply"
        click_button "Suspend"

        visit "/login"
        fill_in "username", with: "Test25_Username"
        fill_in "password", with: "Test25_Password"

        click_button "Submit"
        expect(page).to have_content "User is suspended"
        (DB[:users].where(username: "Test25_Username")).delete 
       end
    end

    context "restore" do
        it "admin can restore suspended users" do

            visit "/create_account"
            fill_in "username", with: "Test26_Username"
            fill_in "email", with: "Test26_Email"
            fill_in "password", with: "Test25_Password"
            click_button "Submit"
            visit "/admin"
            fill_in "user_search1", with: "Test26_Username"
            click_button "Apply"
            click_button "Suspend"

            visit "/login"
            fill_in "username", with: "Test26_Username"
            fill_in "password", with: "Test25_Password"

            click_button "Submit"
            expect(page).to have_content "User is suspended"

            visit "/admin"
            fill_in "user_search1", with: "Test26_Username"
            click_button "Apply"
            click_button "Restore"

            visit "/login"
            fill_in "username", with: "Test26_Username"
            fill_in "password", with: "Test25_Password"
            click_button "Submit"
            expect(page).to have_content "Welcome"
            (DB[:users].where(username: "Test26_Username")).delete 
        end
    end
  end
end

