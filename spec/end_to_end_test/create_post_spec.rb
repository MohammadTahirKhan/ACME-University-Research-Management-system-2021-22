require_relative "../spec_helper"

describe "Create Post Page" do
  it "checks if a post is created" do 
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_Content"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_Content"
    expect(page).to have_content "Test26_Link"
    (DB[:posts].where(title: "Test26_Title")).delete 
  end

  it "will not create a post with no details" do
    visit "/create_post"
    click_button "Submit"
    expect(page).to have_content "Create a Post"
  end

  it "checks that the title error message is displayed" do
    visit "/create_post"
    fill_in "topic", with: "Test26_Topic"
    fill_in "link", with: "Test26_Link"
    fill_in "content", with: "Test26_Content"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for title"
  end

  it "checks that the topic error message is displayed" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "link", with: "Test26_Link"
    fill_in "content", with: "Test26_Content"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for topic"
  end

  it "checks that the link error message is displayed" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_Content"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for link"
  end

  it "checks that the content error message is displayed" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for content"
  end

  it "post is created with default sponsor Acme when sponsor is left empty " do 
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "content", with: "Test26_Content"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_Content"
    expect(page).to have_content "Acme"
    expect(page).to have_content "Test26_Link"
    (DB[:posts].where(title: "Test26_Title")).delete 
  end

  it "checks if a post is created" do 
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "sponsor", with: "Test26_sponsor"
    fill_in "content", with: "Test26_Content"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_Content"
    expect(page).to have_content "Test26_sponsor"
    expect(page).to have_content "Test26_Link"
    (DB[:posts].where(title: "Test26_Title")).delete 
  end
  
  it "can be accessed from the home page" do
    visit "/home"
    click_link "Post"
    expect(page).to have_content "Create a Post"
  end

  it "can be accessed from the admin page" do
    visit "/admin"
    click_link "Post"
    expect(page).to have_content "Create a Post"
  end

  it "can be accessed from the moderator page" do
    visit "/moderator"
    click_link "Post"
    expect(page).to have_content "Create a Post"
  end

  it "can be accessed from the viewer page" do
    visit "/viewer"
    click_link "Post"
    expect(page).to have_content "Create a Post"
  end

  it "can be accessed from the profile page" do
    visit "/profile"
    click_link "Post"
    expect(page).to have_content "Create a Post"
  end

  it "can be accessed from the login as guest link" do
    visit "/login"
    click_link "Log in as guest"
    expect(page).to have_content "Create a Post"
  end
end
