require_relative "../spec_helper"

describe "Create Account Page" do
  it "checks if the account is created" do 
    visit "/create_account"
    fill_in "username", with: "Test25_Username"
    fill_in "email", with: "Test25_Email"
    fill_in "institution", with: "Test25_Institution"
    fill_in "password", with: "Test25_Password"
    click_button "Submit"

    visit "/admin"
    expect(page).to have_content "Test25_Username"
    expect(page).to have_content "Test25_Email"
    expect(page).to have_content "Test25_Institution"
    expect(page).to have_content "Test25_Password"

    DB.from("users").delete
  end

  
end
