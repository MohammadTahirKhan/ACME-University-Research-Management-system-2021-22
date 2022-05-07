require "rspec"
require "rack/test"

require_relative '../../app'

RSpec.describe "testing if all the pages are displayed" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "edit details" do
    context "edit user details" do
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
          expect(page).to have_content "Username"
          expect(page).to have_content "Email"
          expect(page).to have_content "Institution"
          expect(page).to have_content "Password"
          fill_in "password", with: "abcde"
          click_button "Submit"

          visit "/login"
          fill_in "username", with: "Test26_Username"
          fill_in "password", with: "abcde"

          click_button "Submit"
          expect(page).to have_content "Welcome"
          
          (DB[:users].where(username: "Test26_Username")).delete 
      end

      it "user can edit personal user details from admin page" do
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

        visit "/admin"

        fill_in "user_search1", with: "Test26_Username"
        click_button "Apply"
        expect(page).to have_content "Edit"
        click_link "Edit"
        expect(page).to have_content "Username"
        expect(page).to have_content "Email"
        (DB[:users].where(username: "Test26_Username")).delete 
      end
    end
    
    context "edit post details" do
      it "moderator and admin can edit posts from moderator page" do
        #for test purposes, first removing all the posts that are waiting to be approved, to be retrieved later
        DB[:posts].where(approved: "Not Approved").update(approved: "")
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
        expect(page).to have_content "Edit"
        click_link "Edit"
        expect(page).to have_content "Title"
        expect(page).to have_content "Topic"
        expect(page).to have_content "Sponsor"
        expect(page).to have_content "Content"
        expect(page).to have_content "Link"

       end

    it "moderator and admin can edit post from viewer page" do
        visit "/login"
        fill_in "username", with: "moderator"
        fill_in "password", with: "moderator"
        click_button "Submit"
        
        visit "/moderator"
        click_button "Approve"

        visit "/viewer"
        fill_in "post_search2", with: "Test27_Topic37abcabc"
        click_button "Apply"

        click_link "Edit"

        expect(page).to have_content "Title"
        expect(page).to have_content "Topic"
        expect(page).to have_content "Sponsor"
        expect(page).to have_content "Content"
        expect(page).to have_content "Link"

        DB[:posts].where(Title: "Test27_Title").delete
        DB[:users].where(username: "Test26_Username").delete
        DB[:posts].where(approved: "").update(approved: "Not Approved")
      end
    end

  end
end

        