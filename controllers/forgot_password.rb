require "sinatra"
require "sqlite3"

get "/forgot_password" do
  erb :forgot_password
end

post "/forgot_password" do
  @username_field = params["username"]
  @form_was_submitted = !@username_field.empty? && (DB[:users].where(username: @username_field)).count == 1

  @password_confirmation = nil

  if @form_was_submitted
    user = DB[:users].where(username: @username_field)
  
    user.update(:password_reset => "Y")
    @password_confirmation = true
  else
    @username_error = "Please enter a value for username" if @username_field.empty?
  end

  erb :forgot_password
end