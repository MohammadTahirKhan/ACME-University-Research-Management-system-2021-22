require_relative "../spec_helper"

describe "Create Post Page" do
  it "checks if a post is created" do
    visit "/create_post"
    fill_in "title", with: "Test26_Title"
    fill_in "topic", with: "Test26_Topic"
    fill_in "institution", with: "Test26_Institution"
    fill_in "link", with: "Test26_Link"
    click_button "Submit"

    visit "/moderator"
    expect(page).to have_content "Test26_Title"
    expect(page).to have_content "Test26_Topic"
    expect(page).to have_content "Test26_Institution"
    expect(page).to have_content "Test26_Link"
    DB.from("posts").delete
  end
end