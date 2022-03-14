require "sinatra"

get "/admin" do
  @users = User.all
  erb :admin
end