require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

#   describe "the link 'go to password reset page' on the admin page works correctly/takes admin 
#     to password reset requests page" do
# #     it "displays a table when the database contains a post" do
# #       get "/viewer"
# #       if ( Post.all.count == 0) 
# #         expect(last_response.body).to include("The database is empty!")
# #       else 
# #         expect(last_response.body).to include("Title")

# #       end
# #     end
# #   end

    describe "forgort password and assigninf a new password" do
        context "user can send a forgot password request" do
            (DB[:users].where(username: "Test25_Username")).delete 
             #for test purposes, first removing all the users that are waiting for a new password, to be retrieved later
            DB[:users].where(password_reset: "Y").update(password_reset: " ")
            it "can click on forgot password link from login page to let the admin know" do
                visit "/create_account"
                fill_in "username", with: "Test25_Username"
                fill_in "email", with: "Test25_Email"
                fill_in "password", with: "Test25_Password"
                click_button "Submit"

                visit "/login"

                click_link "Forgot password"
                fill_in "username", with: "Test25_Username"
                click_button "Submit"
                expect(page).to have_content "You will be emailed shortly with a replacement password!"
            end
        end

        context "admin can reset password" do
            it "admin can recieve forgot password requests" do
                visit "/admin"
                click_link "Go To Password Reset Page"
                expect(page).to have_content "Test25_Username"
            end
            it "admin can assign new password" do
                visit "/admin"
                click_link "Go To Password Reset Page"
                click_link "Assign Temporary Password"
                fill_in "password", with: "abcde"
                click_button "Submit"
                visit "/login"

                fill_in "username", with: "Test25_Username"
                fill_in "password", with: "abcde"
                click_button "Submit"
                expect(page).to have_content "Welcome"

                (DB[:users].where(username: "Test25_Username")).delete 
                DB[:users].where(password_reset: " ").update(password_reset: "Y")
            end
        end
    end
end



# describe "if an admin clicks on the button 'assign' without typing in a password,
#     an error message is displayed" do

# describe "once an admin has assigned a new password, there are links available to move to
#     the other pages(admin or password reset page)" do

# describe "if a user clicks on the forgot password link from the login page, they
#     are taken to the forgot password page (MOVE THIS TEST TO A DIFFERENT FILE)" do

# describe "from the forgot password page it is possible to 
#     go back to the login page using the relevant link (MOVE THIS TEST TO A DIFFERENT FILE)" do

# describe "if a user types their username and clicks on the submit button in the forgot password page
#         a new password reset request is added to the admin page/admin password reset page" do
     
# describe "if a user clicks on the submit button in the forgot password page without typing their username in,
#     an error message is displayed" do
    
