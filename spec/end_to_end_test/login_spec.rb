require_relative "../spec_helper"

describe "Login Page" do

  it "is accessible from the logout page" do
    visit "/logout"
    click_link "Login again"
    expect(page).to have_content "Login"
  end
  
  it "Checks if the user is logged in" do 
    visit "/create_account"
    fill_in "username", with: "Test25_Username"
    fill_in "email", with: "Test25_Email"
    fill_in "password", with: "Test25_Password"
    click_button "Submit"

    visit "/login"
    fill_in "username", with: "Test25_Username"
    fill_in "password", with: "Test25_Username"

    visit "/home"
    expect(page).to have_content "Welcome"
    (DB[:users].where(username: "Test25_Username")).delete 
  end

  it "will not login with no details" do
    visit "/login"
    click_button "Submit"
    expect(page).to have_content "Login"

  end

  it "Checks that an error message is displayed" do 
    visit "/login"
    #username field 
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please correct the information below"
  end

  it "Checks that an error message is displayed" do 
    visit "/login"
    #password field 
    fill_in "username", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please correct the information below"
  end

  it "Checks that the username-password combination exists message is displayed" do 
    visit "/login"
    fill_in "username", with: "abjzxncc"
    fill_in "password", with: "cxzjchde"
    click_button "Submit"

    expect(page).to have_content "Username/Password combination incorrect"
  end

  it "Checks if the username is empty" do 
    visit "/login"
    fill_in "password", with: "cxzjchde"
    click_button "Submit"

    expect(page).to have_content "Username cannot be empty"
  end

  it "Checks if the password is empty" do 
    visit "/login"
    click_button "Submit"

    expect(page).to have_content "Password cannot be empty"
  end

  it "Checks if we can login as guest" do 
    visit "/login"
    click_link "Log in as guest"

    expect(page).to have_content "Create a Post"
  end
end