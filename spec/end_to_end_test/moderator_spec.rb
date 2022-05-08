require_relative "../spec_helper"

describe "moderator page" do
  context "with an empty database" do
    it "says the database is empty" do
        #for test purposes, first removing all the posts in the moderator page, to be retrieved later
        DB[:posts].where(approved: "Not Approved").update(approved: "")
        visit "/moderator"
        expect(page).to have_content "The database is empty!"
        #retriving the posts that were removed previously
        DB[:posts].where(approved: "").update(approved: "Not Approved")
    end
  end

  it "shows the record of posts" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_content"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_content"
    expect(page).to have_content "Test26_Link"
    (DB[:posts].where(title: "Test26_Title")).delete 
  end

  it "removes the post if disapproved" do
    #for test purposes, first removing all the posts that are waiting to be approved, to be retrieved later
    DB[:posts].where(approved: "Not Approved").update(approved: "")
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_content"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    click_button "Disapprove"
    
    visit "/moderator"
    fill_in "post_search2", with: "Test26_Topic"
    click_button "Apply"
    expect(page).to have_content "The database is empty!"
    expect(page).to have_content "There are no posts!"

    visit "/viewer"
    fill_in "post_search2", with: "Test26_Topic"
    click_button "Apply"
    expect(page).to have_content "The database is empty!"
    expect(page).to have_content "There are no posts!"
    #retriving the posts that were removed previously
    DB[:posts].where(approved: "").update(approved: "Not Approved")
  end


  it "adds the post to viewer page if approved" do
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
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_content"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    fill_in "post_search2", with: "Test26_Topic"
    click_button "Apply"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_content"
    expect(page).to have_content "Test26_Link"
    (DB[:posts].where(title: "Test26_Title")).delete 
  end

  it "shows the record of the post according to the sponsor searched" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_content"
    fill_in "sponsor", with: "Test26_sponsor"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    fill_in "post_search3", with: "Test26_sponsor"
    click_button "Apply"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_content"
    expect(page).to have_content "Test26_sponsor"
    expect(page).to have_content "Test26_Link"
    (DB[:posts].where(title: "Test26_Title")).delete 
  end

  it "gives an error if the post searched does not exist" do
    visit "/moderator"
    fill_in "post_search2", with: "ashvcasxabms"
    click_button "Apply"
    expect(page).to have_content "The database is empty!"
    expect(page).to have_content "There are no posts!"
  end
  it "gives an error if the post searched does not exist" do
    visit "/moderator"
    fill_in "post_search3", with: "ashvasccabms"
    click_button "Apply"
    expect(page).to have_content "The database is empty!"
    expect(page).to have_content "There are no posts!"
  end
end
