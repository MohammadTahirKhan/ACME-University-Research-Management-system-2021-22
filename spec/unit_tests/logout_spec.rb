require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "After clicking on logout, there is an option/link to log in again" do
#     it "displays a table when the database contains a post" do
#       get "/viewer"
#       if ( Post.all.count == 0) 
#         expect(last_response.body).to include("The database is empty!")
#       else 
#         expect(last_response.body).to include("Title")

#       end
#     end
#   end

it "can be accessed from..." do
    #     visit "/profile"
    #     click_link "Post"
    #     expect(page).to have_content "Create a Post"
    #   end