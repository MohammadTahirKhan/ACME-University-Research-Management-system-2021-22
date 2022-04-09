require "sinatra"

get "/home" do
  erb :home
end

get "/create_account" do
  erb :create_account
end

get "/create_post" do
  erb :create_post
end
