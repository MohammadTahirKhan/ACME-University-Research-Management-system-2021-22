require "sinatra"

# post "/edit" do

#   id = params["id"]

#   user = User[id]
#   # user.update(:user_type => "moderator") 

#   erb :edit_user
# end

post "/edit_mod" do

  id = params["id"]

  user = User[id]
  user.update(:user_type => "moderator") 

  erb :confirmation
end

post "/edit_admin" do
  id = params["id"]

  user = User[id]
  user.update(:user_type => "admin")

  erb :confirmation
end

post "/edit_poster" do
  id = params["id"]
  
  user = User[id]
  user.update(:user_type => "poster")
  
  erb :confirmation
end
  
post "/edit_view" do
  id = params["id"]
  
  user = User[id]
  user.update(:user_type => "viewer")
  
  erb :confirmation
end




get "/admin" do

  @user_search = params.fetch("user_search", "").strip

  # shows the result according to the search bar 
  @users = if @user_search.empty?
    User.all
  else
    User.where(Sequel.like(:username, "%#{@user_search}%"))
  end
  
  erb :admin
end