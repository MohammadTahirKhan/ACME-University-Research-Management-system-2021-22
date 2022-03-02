require "sinatra"

get "/login" do
    erb :login
end

get "/home" do
    erb :home
end

get "/moderator" do
    erb :moderator
end

get "/admin" do
    erb :admin
end

get "/viewer" do
    erb :viewer
end

get "/profile" do
    erb :profile
end

get "/create_account" do
    erb :create_account
end

