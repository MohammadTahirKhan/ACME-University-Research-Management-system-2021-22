require "sinatra"

get "/password_reset" do
  @users = User.all
  erb :password_reset
end

post "/assign_temp_password" do
  @password_field = params["password"]
  @user_id = params["id"]
  @form_was_submitted = !@password_field.empty?

  @password_confirmation = nil

  if @form_was_submitted
    user = DB[:users].where(id: @user_id)
    user.update(:password => @password_field)
    user.update(:password_reset => "N")
  else
    @password_error = "Please enter a value for password" if @password_field.empty?
  end

  erb :confirmation
end