require_relative "../spec_helper"

describe "profile page" do
    it "shows user's personal account details" do
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
        expect(page).to have_content "Test26_Username"
        (DB[:users].where(username: "Test26_Username")).delete 
    end

    it "shows user's personal posts details" do
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
        fill_in "title", with: "Test26_Title"
        fill_in "topic", with: "Test26_Topic"
        fill_in "content", with: "Test26_Content"
        fill_in "link", with: "Test26_Link"
        click_button "Submit"

        visit "/profile"
        expect(page).to have_content "Test26_Username"
        expect(page).to have_content "Test26_Title"
        expect(page).to have_content "Test26_Topic"
        expect(page).to have_content "Test26_Content"
        expect(page).to have_content "Test26_Link"

        (DB[:users].where(username: "Test26_Username")).delete 
        (DB[:posts].where(title: "Test26_Title")).delete 
    end
end
