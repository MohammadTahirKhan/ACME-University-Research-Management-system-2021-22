require "rspec"
require "rack/test"

require_relative '../../app'

RSpec.describe "testing if all the pages are displayed" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /home" do
    it "has a status code of 200 (OK)" do
      get "/home"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /login" do
    it "has a status code of 200 (OK)" do
      get "/login"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /create_post" do
    it "has a status code of 200 (OK)" do
      get "/create_post"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /moderator" do
    it "has a status code of 200 (OK)" do
      get "/moderator"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /admin" do
    it "has a status code of 200 (OK)" do
      get "/admin" 
      expect(last_response.status).to eq(200)
    end 
  end

  describe "GET /viewer" do
    it "has a status code of 200 (OK)" do
      get "/viewer" 
      expect(last_response.status).to eq(200)
    end 
  end

  describe "GET /profile" do
    it "has a status code of 200 (OK)" do
      get "/profile" 
      expect(last_response.status).to eq(200)
    end 
  end

  describe "GET /create_account" do
    it "has a status code of 200 (OK)" do
      get "/create_account" 
      expect(last_response.status).to eq(200)
    end 
  end

end
