require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "It is not possible to log in with a suspended account" do
#     it "displays a table when the database contains a post" do
#       get "/viewer"
#       if ( Post.all.count == 0) 
#         expect(last_response.body).to include("The database is empty!")
#       else 
#         expect(last_response.body).to include("Title")

#       end
#     end
#   end

describe "Clicking on the suspend button in the admin page changes 
    the value in the suspended column to Y/suspends the account correctly (database?)" do


describe "Clicking on the restore button in the admin page changes 
    the value in the suspended column to N/restores the account correctly (can now log in with 
        account" do



it "can be accessed from..." do
 #     visit "/profile"
 #     click_link "Post"
#     expect(page).to have_content "Create a Post"
#   end