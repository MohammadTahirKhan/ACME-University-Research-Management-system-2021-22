require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "In the profile page/tab, the user's (CORRECT) account details are displayed 
    (check the details of the current account that is logged in to the system and run
        a comparison with those displayed on the profile page)" do
#     it "displays a table when the database contains a post" do
#       get "/viewer"
#       if ( Post.all.count == 0) 
#         expect(last_response.body).to include("The database is empty!")
#       else 
#         expect(last_response.body).to include("Title")

#       end
#     end
#   end

describe "In the profile page/tab, the user's (CORRECT) posts are displayed 
    (check the details of the current account that is logged in to the system and run
        a comparison with those displayed on the profile page)" do


it "can be accessed from..." do
      #     visit "/profile"
     #     click_link "Post"
        #     expect(page).to have_content "Create a Post"
        #   end