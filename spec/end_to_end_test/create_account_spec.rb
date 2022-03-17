require_relative "../spec_helper"

describe "Create Account Page" do

  it "is accessible from the login page" do
    visit "/login"
    click_link "Create Account"
    expect(page).to have_content "Create an Account"
  end
  

  it "Checks if the account is created" do 
    #session[:logged_in] = true
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

  it "will not create an account with no details" do
    visit "/create_account"
    click_button "Submit"
    expect(page).to have_content "Create an Account"
  end

  it "Checks that the username error message is displayed" do 
    visit "/create_account"
    #username field 
    fill_in "email", with: "test_email"
    fill_in "institution", with: "UOS"
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for username"
  end

  it "Checks that the email error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    #email field
    fill_in "institution", with: "UOS"
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for email"
  end

  it "Checks that the institution error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    #institution field
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for institution"
  end

  it "Checks that the password error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    fill_in "institution", with: "UOS"
    #password field
    click_button "Submit"

    expect(page).to have_content "Please enter a value for password"
  end

end