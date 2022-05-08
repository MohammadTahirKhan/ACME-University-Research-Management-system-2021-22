require_relative "../spec_helper"

describe "Create Account Page" do

  it "is accessible from the login page" do
    visit "/login"
    click_link "Create Account"
    expect(page).to have_content "Create an Account"
  end
  

  it "Checks if the account is created" do 
    visit "/create_account"
    fill_in "username", with: "Test25_Username"
    fill_in "email", with: "Test25_Email"
    fill_in "password", with: "Test25_Password"
    click_button "Submit"

    visit "/admin"
    expect(page).to have_content "Test25_Username"
    expect(page).to have_content "Test25_Email"
    (DB[:users].where(username: "Test25_Username")).delete 
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
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for username"
  end

  it "Checks that the email error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    #email field
    fill_in "password", with: "abc"
    click_button "Submit"

    expect(page).to have_content "Please enter a value for email"
  end

  it "Checks that the password error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    #password field
    click_button "Submit"

    expect(page).to have_content "Please enter a value for password"
  end

  it "Checks that the username is taken error message is displayed" do 
    visit "/create_account"
    #username field 
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    fill_in "password", with: "abc"
    click_button "Submit"

    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email2"
    fill_in "password", with: "abc2"
    click_button "Submit"
    expect(page).to have_content "Sorry, This username is not available"
    (DB[:users].where(username: "Test2")).delete 
  end

  it "shows the record of the user according to the search" do
    visit "/create_account"
    fill_in "username", with: "Test25_Username"
    fill_in "email", with: "Test25_Email"
    fill_in "password", with: "Test25_Password"
    click_button "Submit"

    visit "/admin"
    fill_in "user_search1", with: "Test25_Username"
    click_button "Apply"
    expect(page).to have_content "Test25_Username"
    expect(page).to have_content "Test25_Email"
    (DB[:users].where(username: "Test25_Username")).delete 
  end

  it "set default usertype to poster on default" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    fill_in "password", with: "abc"
    click_button "Submit"
    visit "/admin"
    expect(page).to have_content "Test2"
    expect(page).to have_content "test_email"
    expect(page).to have_content "poster"

    (DB[:users].where(username: "Test2")).delete 
  end

end