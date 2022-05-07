require "rspec"
require "rack/test"

require_relative '../../app'

RSpec.describe "testing if all the pages are displayed" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "delete posts" do
    it "admin and moderator can delete posts from viewer page" do
        visit "/create_account"
        fill_in "username", with: "Test26_Username"
        fill_in "email", with: "Test26_Email"
        fill_in "password", with: "Test25_Password"
        click_button "Submit"

        visit "/login"
        fill_in "username", with: "Test26_Username"
        fill_in "password", with: "Test25_Password"
        click_button "Submit"
        visit "/create_post"
        fill_in "title", with: "Test27_Title"
        fill_in "topic", with: "Test27_Topic37abcabc"
        fill_in "content", with: "Test27_Content"
        fill_in "link", with: "Test27_Link"
        click_button "Submit"

        visit "/login"
        fill_in "username", with: "moderator"
        fill_in "password", with: "moderator"
        click_button "Submit"
        visit "/moderator"
        fill_in "post_search2", with: "Test27_Topic37abcabc"
        click_button "Apply"
        click_button "Approve"

        visit "/viewer"
        fill_in "post_search2", with: "Test27_Topic37abcabc"
        click_button "Apply"

        click_button "Delete"
        visit "/viewer"
        fill_in "post_search2", with: "Test27_Topic37abcabc"
        click_button "Apply"
        
        expect(page).to have_content "There are no posts!"

        DB[:posts].where(Title: "Test27_Title").delete
        DB[:users].where(username: "Test26_Username").delete
    end
  end
end
