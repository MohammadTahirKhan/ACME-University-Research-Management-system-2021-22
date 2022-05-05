# require "rspec"
# require "rack/test"
# require_relative "../spec_helper"

# require_relative "../../app"

# RSpec.describe "Viewer page" do
#   include Rack::Test::Methods

#   def app
#     Sinatra::Application
#   end

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
# describe "from the password reset requests page it is possible to go back to the admin page" do

# describe "if an admin assigns/types a new password and clicks on the button 'assign',
#     that account is now able to log in using the new password" do


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
    


# it "can be accessed from..." do
#     #     visit "/profile"
#     #     click_link "Post"
#     #     expect(page).to have_content "Create a Post"
#     #   end