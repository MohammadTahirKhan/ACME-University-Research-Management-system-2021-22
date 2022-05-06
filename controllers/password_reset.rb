require "sinatra"

get "/password_reset" do
  @users = User.all
  erb :password_reset
end

# post "/assign_temp_password" do
#   @password_field = params["password"]
#   @user_id = params["id"]
#   @form_was_submitted = !@password_field.empty?

#   @password_confirmation = nil

#   if @form_was_submitted
#     user = DB[:users].where(id: @user_id)
#     user.update(:password => @password_field)
#     user.update(:password_reset => "N")
#   else
#     @password_error = "Please enter a value for password" if @password_field.empty?
#   end

#   erb :confirmation
# end

get "/assign_temp_password" do
  id = params["id"]
  @user = User[id] if User.id_exists?(id)
  erb :assign_temp_password
end

post "/assign_temp_password" do
  id = params["id"]

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