require "sinatra"

# post "assign_temp_password" do

get "/password_reset" do
  erb :password_reset
end