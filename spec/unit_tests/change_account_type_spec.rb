require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Admin page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

describe "Change account type" do
  context "Clicking on the moderator/admin/viewer/poster buttons changes the account type to that button's value" do
    it "Clicking on the moderator button changes the account type to moderator" do
      visit "/create_account"
      fill_in "username", with: "Test25_Username"
      fill_in "email", with: "Test25_Email"
      fill_in "password", with: "Test25_Password"
      click_button "Submit"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "Test25_Username"
      expect(page).to have_content "Test25_Email"
      expect(page).to have_content "poster"

      click_button "Moderator"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "moderator"
      (DB[:users].where(username: "Test25_Username")).delete 
    end
  
    it "Clicking on the admin button changes the account type to admin" do
      visit "/create_account"
      fill_in "username", with: "Test25_Username"
      fill_in "email", with: "Test25_Email"
      fill_in "password", with: "Test25_Password"
      click_button "Submit"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "Test25_Username"
      expect(page).to have_content "Test25_Email"
      expect(page).to have_content "poster"

      click_button "Admin"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "admin"
      (DB[:users].where(username: "Test25_Username")).delete 
    end

    it "Clicking on the viewer button changes the account type to viewer" do
      visit "/create_account"
      fill_in "username", with: "Test25_Username"
      fill_in "email", with: "Test25_Email"
      fill_in "password", with: "Test25_Password"
      click_button "Submit"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "Test25_Username"
      expect(page).to have_content "Test25_Email"
      expect(page).to have_content "poster"

      click_button "Viewer"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "viewer"
      (DB[:users].where(username: "Test25_Username")).delete 
    end

    it "Clicking on the poster button changes the account type back to poster" do
      visit "/create_account"
      fill_in "username", with: "Test25_Username"
      fill_in "email", with: "Test25_Email"
      fill_in "password", with: "Test25_Password"
      click_button "Submit"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "Test25_Username"
      expect(page).to have_content "Test25_Email"
      expect(page).to have_content "poster"

      click_button "Moderator"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "moderator"

      click_button "Poster"
      visit "/admin"
      fill_in "user_search1", with: "Test25_Username"
      click_button "Apply"
      expect(page).to have_content "poster"
      (DB[:users].where(username: "Test25_Username")).delete 
    end
  end
end
end
