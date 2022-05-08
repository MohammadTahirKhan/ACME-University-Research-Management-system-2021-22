require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "forgot password and assigning a new password" do
    context "user can send a forgot password request" do
      #for test purposes, first removing all the users that are waiting for a new password, to be retrieved later
      DB[:users].where(password_reset: "Y").update(password_reset: " ")

      it "can click on forgot password link from login page to let the admin know" do
        visit "/create_account"
        fill_in "username", with: "Test25_Username"
        fill_in "email", with: "Test25_Email"
        fill_in "password", with: "Test25_Password"
        click_button "Submit"

        visit "/login"

        click_link "Forgot password"
        fill_in "username", with: "Test25_Username"
        click_button "Submit"
        expect(page).to have_content "You will be emailed shortly with a replacement password!"
      end
      it "gives an error message, if a user clicks on the submit button in the forgot password page 
      without typing their username in" do
        visit "/login"
        click_link "Forgot password"
        click_button "Submit"
        expect(page).to have_content "Please enter a value for username"
      end
    end

    context "admin can reset password" do
      it "admin can recieve forgot password requests" do
        visit "/admin"
        click_link "Go To Password Reset Page"
        expect(page).to have_content "Test25_Username"
      end
      it "if an admin clicks on the button 'assign' without typing in a password,
        an error message is displayed" do
        visit "/admin"
        click_link "Go To Password Reset Page"
        click_link "Assign Temporary Password"
        click_button "Submit"
        expect(page).to have_content "Password cannot be empty"
      end
      it "admin can assign new password" do
        visit "/admin"
        click_link "Go To Password Reset Page"
        click_link "Assign Temporary Password"
        fill_in "password", with: "abcde"
        click_button "Submit"
        visit "/login"
        fill_in "username", with: "Test25_Username"
        fill_in "password", with: "abcde"
        click_button "Submit"
        expect(page).to have_content "Welcome"
        (DB[:users].where(username: "Test25_Username")).delete 
      end
      it "if there are no password reset requests" do
        visit "/admin"
        click_link "Go To Password Reset Page"
        expect(page).to have_content "There are no password reset requests!"
        #retrieve all the password reset requests that were removed previously 
        DB[:users].where(password_reset: " ").update(password_reset: "Y")
      end
    end
  end
end

