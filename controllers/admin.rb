require "sinatra"

get "/admin" do
  redirect "/login" unless session[:logged_in]
  @users = User.all
  erb :admin
end