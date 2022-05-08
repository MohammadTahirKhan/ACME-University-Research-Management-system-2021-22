require "sinatra"

post "/edit_mod" do
  #change account type to moderator
  id = params["id"]

  user = User[id]
  user.update(:user_type => "moderator") 

  erb :confirmation
end

post "/edit_admin" do
  #change account type to admin
  id = params["id"]

  user = User[id]
  user.update(:user_type => "admin")

  erb :confirmation
end

post "/edit_poster" do
  #change account type to poster
  id = params["id"]
  
  user = User[id]
  user.update(:user_type => "poster")
  
  erb :confirmation
end
  
post "/edit_view" do
  #change account type to viewer
  id = params["id"]
  
  user = User[id]
  user.update(:user_type => "viewer")
  
  erb :confirmation
end

post "/suspend_user" do
  #suspend user
  id = params["id"]
  
  user = User[id]
  user.update(:suspended => "Y")

  erb :confirmation
end

post "/restore_user" do
  #restore user
  id = params["id"]
  
  user = User[id]
  user.update(:suspended => "N")

  erb :confirmation
end

get "/admin" do

  @user_search1 = params.fetch("user_search1", "").strip
  @user_search2 = params.fetch("user_search2", "").strip

  # shows the result according to the filters 
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