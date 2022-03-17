require_relative "../spec_helper"

describe "Login Page" do

  it "is accessible from the logout page" do
    visit "/logout"
    click_link "Login again"
    expect(page).to have_content "Login"
  end
  

  it "Checks if the user is logged in" do 
    # session[:logged_in] = true
    visit "/create_account"
    fill_in "username", with: "Test25_Username"
    fill_in "email", with: "Test25_Email"
    fill_in "institution", with: "Test25_Institution"
    fill_in "password", with: "Test25_Password"
    click_button "Submit"

    visit "/login"
    fill_in "username", with: "Test25_Username"
    fill_in "password", with: "Test25_Username"

    expect(page).to have_content "Welcome"
    DB.from("users").delete
  end

  it "will not login with no details" do
    visit "/login"
    click_button "Submit"
    expect(page).to have_content "Login"
    expect(page).to have_content "Please correct the information below"

  end

  it "Checks that an error message is displayed" do 
    visit "/create_account"
    #username field 
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please correct the information below"
    expect(page).to have_content "Password cannot be empty"
  end

  it "Checks that an error message is displayed" do 
    visit "/create_account"
    #password field 
    fill_in "username", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please correct the information below"
    expect(page).to have_content "Username cannot be empty"
  end

  it "Checks that the username-password combination exists message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "abjzxncc"
    fill_in "password", with: "cxzjchde"
    click_button "Submit"

    expect(page).to have_content "Username/Password combination incorrect"
  end
end