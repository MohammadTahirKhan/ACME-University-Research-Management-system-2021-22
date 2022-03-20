require_relative "../spec_helper"

describe "admin page" do
  context "with an empty database" do
    it "says the database is empty" do
        visit "/admin"
        fill_in "user_search", with: "ashvcabms"
        click_button "Submit"
        expect(page).to have_content "The database is empty!"
    end
  end

  context "with one or more record in the database" do
    it "shows the record of the users" do
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

    it "shows the record of the user according to the search" do
        visit "/create_account"
        fill_in "username", with: "Test25_Username"
        fill_in "email", with: "Test25_Email"
        fill_in "institution", with: "Test25_Institution"
        fill_in "password", with: "Test25_Password"
        click_button "Submit"

        visit "/admin"
        fill_in "user_search", with: "Test25_Username"
        click_button "Submit"
        expect(page).to have_content "Test25_Username"
        expect(page).to have_content "Test25_Email"
        expect(page).to have_content "Test25_Institution"
        expect(page).to have_content "Test25_Password"
        DB.from("users").delete
    end

    it "gives an error if the user searched does not exist" do
        visit "/admin"
        fill_in "user_search", with: "ashvcabms"
        click_button "Submit"
        expect(page).to have_content "The database is empty!"
        expect(page).to have_content "There are no users!"
    end
  end
end
