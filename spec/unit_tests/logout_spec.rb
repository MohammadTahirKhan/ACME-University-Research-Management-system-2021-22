require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "logout page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "After clicking on logout, there is an option/link to log in again" do
    it "clicking on logout" do
      visit "/logout"
      click_link "Login again"
      expect(page).to have_content "Login"
    end
  end
  it "can be accessed from the home page" do
    visit "/home"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  it "can be accessed from the post page" do
    visit "/create_post"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  it "can be accessed from the viewer page" do
    visit "/viewer"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  it "can be accessed from the profile page" do
    visit "/profile"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  it "can be accessed from the moderator page" do
    visit "/moderator"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  it "can be accessed from the admin page" do
    visit "/moderator"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  it "can be accessed from the admin page" do
    visit "/admin"
    click_link "logout"
    expect(page).to have_content "Logged out"
  end
  
end
