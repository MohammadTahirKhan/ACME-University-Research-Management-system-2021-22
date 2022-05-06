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

post "/suspend_user" do
  id = params["id"]
  
  user = User[id]
  user.update(:suspended => "Y")

  erb :confirmation
end

post "/restore_user" do
  id = params["id"]
  
  user = User[id]
  user.update(:suspended => "N")

  erb :confirmation
end

get "/admin" do

  @user_search1 = params.fetch("user_search1", "").strip
  @user_search2 = params.fetch("user_search2", "").strip

  # shows the result according to the search bar 
  if @user_search1.empty? && @user_search2.empty?
    @users = User.all
  end
  if !@user_search1.empty? && @user_search2.empty?
    @users = User.where(Sequel.like(:username, "%#{@user_search1}%"))
  end
  if @user_search1.empty? && !@user_search2.empty?
    @users = User.where(Sequel.like(:institution, "%#{@user_search2}%"))
  end
  if !@user_search1.empty? && !@user_search2.empty?
    @user = User.where(Sequel.like(:username, "%#{@user_search1}%"))
    @users = @user.where(Sequel.like(:institution, "%#{@user_search2}%"))
  end
  
  erb :admin
end