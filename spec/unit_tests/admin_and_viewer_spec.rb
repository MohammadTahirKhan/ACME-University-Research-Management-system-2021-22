require "rspec"
require "rack/test"
require_relative "../spec_helper"

require_relative "../../app"

RSpec.describe "Viewer page" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Displays the posts table" do
    it "displays a table when the database contains a post" do
      get "/viewer"
      if ( Post.all.count == 0) 
        expect(last_response.body).to include("The database is empty!")
      else 
        expect(last_response.body).to include("Title")

      end
    end
  end

    describe "Displays the users table" do
        it "displays a table when the database contains a user" do
          get "/admin"
          if ( User.all.count == 0) 
            expect(last_response.body).to include("The database is empty!")
          else 
            expect(last_response.body).to include("Username")
    
          end
        end
#  Coverage tests
    it "rejects the form when only title field is filled out" do
      get "/create_post", "title" => "Some Text"
     expect(last_response.body).to include("Please")
     
    end

    it "rejects the form when only institution field is filled out" do
      get "/create_post", "institution" => "Some Text"
      expect(last_response.body).to include("Please")
     
    end
  
end
end
