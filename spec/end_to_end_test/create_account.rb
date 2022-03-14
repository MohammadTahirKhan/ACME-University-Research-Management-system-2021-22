require_relative "../spec_helper"
describe "Create Account Page" do
  it "Checks if the account is created" do 
    visit "/create_account"
    fill_in "username", with: "Test25_Username"
    fill_in "email", with: "Test25_Email"
    fill_in "institution", with: "Test25_Institution"
    fill_in "password", with: "Test25_Password"
    click_button "Submit"

    visit "/admin
    expect(page).to have_content "Test25_Username"
    expect(page).to have_content "Test25_Email"
    expect(page).to have_content "Test25_Institution"
    expect(page).to have_content "Test25_Password"
    DB.from("users").delete
  end

  it "Checks that an error message is displayed" do 
    visit "/create_account"
    #username field 
    fill_in "email", with: "test_email"
    fill_in "user_type", with: "x"
    fill_in "institution", with: "UOS"
    fill_in "password", with: "abc"
    click_button "Submit"

    #visit "/create_account"
    visit "/create_account"
    expect(page).to have_content "Please enter a value for username"

    DB.from("users").delete
  end

  it "Checks that an error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    #email field
    fill_in "user_type", with: "x"
    fill_in "institution", with: "UOS"
    fill_in "password", with: "abc"
    click_button "Submit"


  visit "/create_account"
  expect(page).to have_content "Please enter a value for email"

  DB.from("users").delete
  end

  it "Checks that the account is not created and an error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    #user_type field 
    fill_in "institution", with: "UOS"
    fill_in "password", with: "abc"
    click_button "Submit"


  visit "/create_account"
  expect(page).to have_content "Sorry, This username is not available"

  DB.from("users").delete
  end

  it "Checks that the account is not created and an error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    fill_in "user_type", with: "x"
    #institution field
    fill_in "password", with: "abc"
    click_button "Submit"


  visit "/create_account"
  expect(page).to have_content "Please enter a value for institution"

  DB.from("users").delete
  end

  it "Checks that the account is not created and an error message is displayed" do 
    visit "/create_account"
    fill_in "username", with: "Test2"
    fill_in "email", with: "test_email"
    fill_in "user_type", with: "x"
    fill_in "institution", with: "UOS"
    #password field
    click_button "Submit"


  visit "/create_account"
  expect(page).to have_content "Please enter a value for password"

  DB.from("users").delete
  end

end