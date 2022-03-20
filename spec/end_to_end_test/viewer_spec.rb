require_relative "../spec_helper"

describe "viewer page" do
  context "with an empty database" do
    it "says the database is empty" do
        visit "/viewer"
        fill_in "post_search", with: "ashvcabms"
        click_button "Submit"
        expect(page).to have_content "The database is empty!"
    end
  end

  context "with one or more record in the database" do
    it "shows the record of posts" do
        visit "/create_post"
        fill_in "title", with: "Test26_Title"
        fill_in "topic", with: "Test26_Topic"
        fill_in "institution", with: "Test26_Institution"
        fill_in "link", with: "Test26_Link"
        click_button "Submit"
    
        visit "/viewer"
        expect(page).to have_content "Test26_Title"
        expect(page).to have_content "Test26_Topic"
        expect(page).to have_content "Test26_Institution"
        expect(page).to have_content "Test26_Link"
        (DB[:posts].where(title: "Test26_Title")).delete 
    end

    it "shows the record of the post according to the search" do
        visit "/create_post"
        fill_in "title", with: "Test26_Title"
        fill_in "topic", with: "Test26_Topic"
        fill_in "institution", with: "Test26_Institution"
        fill_in "link", with: "Test26_Link"
        click_button "Submit"
    
        visit "/viewer"
        fill_in "post_search", with: "Test26_Institution"
        click_button "Submit"
        expect(page).to have_content "Test26_Title"
        expect(page).to have_content "Test26_Topic"
        expect(page).to have_content "Test26_Institution"
        expect(page).to have_content "Test26_Link"
        (DB[:posts].where(title: "Test26_Title")).delete 
    end

    it "gives an error if the post searched does not exist" do
        visit "/viewer"
        fill_in "post_search", with: "ashvcabms"
        click_button "Submit"
        expect(page).to have_content "The database is empty!"
        expect(page).to have_content "There are no posts!"
    end
  end
end