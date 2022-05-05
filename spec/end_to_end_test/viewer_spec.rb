require_relative "../spec_helper"

describe "viewer page" do
  context "with an empty database" do
    it "says the database is empty" do
        #for test purposes, first removing all the posts in the viewer page, to be retrieved later
        DB[:posts].where(approved: "Approved").update(approved: "")
        visit "/viewer"
        expect(page).to have_content "The database is empty!"
        #retriving the posts that were removed previously
        DB[:posts].where(approved: "").update(approved: "Approved")
    end
  end

  context "with one or more record in the database" do
    it "shows the record of posts if approved" do
        #for test purposes, first removing all the posts that are waiting to be approved, to be retrieved later
        DB[:posts].where(approved: "Not Approved").update(approved: "")

        visit "/create_post"
        fill_in "title", with: "Test26_Title"
        fill_in "topic", with: "Test26_Topic"
        fill_in "content", with: "Test26_content"
        fill_in "link", with: "Test26_Link"
        click_button "Submit"

        visit "/moderator"
        click_button "Approve"
        
        visit "/viewer"
        expect(page).to have_content "Test26_Title"
        expect(page).to have_content "Test26_Topic"
        expect(page).to have_content "Test26_content"
        expect(page).to have_content "Test26_Link"
        (DB[:posts].where(title: "Test26_Title")).delete 
        #retriving the posts that were removed previously
        DB[:posts].where(approved: "").update(approved: "Not Approved")
    end

    it "shows the record of the post according to the topic searched" do
        visit "/create_post"
        #for test purposes, first removing all the posts that are waiting to be approved, to be retrieved later
        DB[:posts].where(approved: "Not Approved").update(approved: "")

        fill_in "title", with: "Test26_Title"
        fill_in "topic", with: "Test26_Topic"
        fill_in "content", with: "Test26_content"
        fill_in "link", with: "Test26_Link"
        click_button "Submit"

        visit "/moderator"
        click_button "Approve"

        visit "/viewer"
        fill_in "post_search2", with: "Test26_Topic"
        click_button "Apply"
        expect(page).to have_content "Test26_Title"
        expect(page).to have_content "Test26_Topic"
        expect(page).to have_content "Test26_content"
        expect(page).to have_content "Test26_Link"
        (DB[:posts].where(title: "Test26_Title")).delete 
        #retriving the posts that were removed previously
        DB[:posts].where(approved: "").update(approved: "Not Approved")
    end

    it "shows the record of the post according to the sponsor searched" do
      visit "/create_post"
      #for test purposes, first removing all the posts that are waiting to be approved, to be retrieved later
      DB[:posts].where(approved: "Not Approved").update(approved: "")

      fill_in "title", with: "Test26_Title"
      fill_in "topic", with: "Test26_Topic"
      fill_in "content", with: "Test26_content"
      fill_in "sponsor", with: "Test26_sponsor"
      fill_in "link", with: "Test26_Link"
      click_button "Submit"

      visit "/moderator"
      click_button "Approve"

      visit "/viewer"
      fill_in "post_search3", with: "Test26_sponsor"
      click_button "Apply"
      expect(page).to have_content "Test26_Title"
      expect(page).to have_content "Test26_Topic"
      expect(page).to have_content "Test26_content"
      expect(page).to have_content "Test26_sponsor"
      expect(page).to have_content "Test26_Link"
      (DB[:posts].where(title: "Test26_Title")).delete 
      #retriving the posts that were removed previously
      DB[:posts].where(approved: "").update(approved: "Not Approved")
  end

    it "gives an error if the post searched does not exist" do
        visit "/viewer"
        fill_in "post_search2", with: "ashvcabms"
        click_button "Apply"
        expect(page).to have_content "The database is empty!"
        expect(page).to have_content "There are no posts!"
    end
    it "gives an error if the post searched does not exist" do
      visit "/viewer"
      fill_in "post_search3", with: "ashvcabms"
      click_button "Apply"
      expect(page).to have_content "The database is empty!"
      expect(page).to have_content "There are no posts!"
  end
  end
  
end