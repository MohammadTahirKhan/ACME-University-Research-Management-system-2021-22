# require "sinatra"

# post "/edit_mod" do

#     id = params["id"]
  
#     user = User[id]
#     user.update(:user_type => "moderator") 
  
#     erb :edit_user
#   end
  
#   post "/edit_admin" do
#     id = params["id"]
  
#     user = User[id]
#     user.update(:user_type => "admin")
  
#     erb :edit_user
#   end
  
#   post "/edit_poster" do
#     id = params["id"]
    
#     user = User[id]
#     user.update(:user_type => "poster")
    
#     erb :edit_user
#   end
    
#   post "/edit_view" do
#     id = params["id"]
    
#     user = User[id]
#     user.update(:user_type => "viewer")
    
#     erb :edit_user
#   end
  
# get "/admin" do

#     @users = User.all

#     erb :edit_user
# end
