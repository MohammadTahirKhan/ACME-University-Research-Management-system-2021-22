require "sinatra"

get "/login" do
  erb :login
end

get "/home" do
  # redirect "/login" unless session[:logged_in]
  erb :home
end

get "/moderator" do
  # redirect "/login" unless session[:logged_in]
  erb :moderator
end

get "/admin" do
  # redirect "/login" unless session[:logged_in]
  erb :admin
end


get "/profile" do
  # redirect "/login" unless session[:logged_in]
  erb :profile
end

get "/create_account" do
  erb :create_account
end

get "/create_post" do
  # redirect "/login" unless session[:logged_in]
  erb :create_post
end
