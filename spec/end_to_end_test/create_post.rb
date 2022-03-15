require_relative "../spec_helper"

describe "Create Post Page" do
  it "checks if a post is created" do
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
    DB.from("posts").delete
  end

  it "will not create an account with no details" do
    visit "/create_post"
    click_button "Submit"
    expect(page).to have_content "Create a Post"
  end

  it "checks that the title error message is displayed" do
    visit "/create_post"
    fill_in "topic", with: "Test26_Topic"
    fill_in "institution", with: "Test26_Institution"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for title"
  end

  it "checks that the topic error message is displayed" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "institution", with: "Test26_Institution"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for topic"
  end

  it "checks that the institution error message is displayed" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for institution"
  end

  it "checks that the link error message is displayed" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "institution", with: "Test26_Institution"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for link"
  end
end
