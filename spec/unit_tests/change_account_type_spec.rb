require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Clicking on the moderator/admin/viewer/poster buttons changes the 
    account type to that button's value" do
#     it "displays a table when the database contains a post" do
#       get "/viewer"
#       if ( Post.all.count == 0) 
#         expect(last_response.body).to include("The database is empty!")
#       else 
#         expect(last_response.body).to include("Title")

#       end
#     end
#   end

describe "When logging in with an admin account type all tabs/powers are
     available/accessible(admin,moderator,viewer etc) (top right of system)" do

describe "When logging in with a moderator account type only moderator and viewer
     tabs/powers are available/accessible (top right of system)" do

describe "When logging in with a viewer account type...     " do
    
describe "When logging in with a poster account type...     " do

describe "When logging in as a guest...     " do

    it "can be accessed from..." do
    #     visit "/profile"
    #     click_link "Post"
    #     expect(page).to have_content "Create a Post"
    #   end