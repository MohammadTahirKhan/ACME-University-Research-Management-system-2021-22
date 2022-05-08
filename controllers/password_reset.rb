require "sinatra"

get "/password_reset" do
  @users = User.all
  erb :password_reset
end


get "/assign_temp_password" do
  id = params["id"]
  @user = User[id] if User.id_exists?(id)
  erb :assign_temp_password
end

post "/assign_temp_password" do
  id = params["id"]
  #if user id exists then proceed to assign a new password
  if User.id_exists?(id)
    @user = User[id]
    @user.load(params)

    if @user.valid?
      @user.save_changes
      redirect "/password_reset"
    end
  end

  erb :assign_temp_password 
end