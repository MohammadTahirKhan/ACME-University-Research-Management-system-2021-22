require "sinatra"

get "/home" do
  @users = User.all
  erb :home
end