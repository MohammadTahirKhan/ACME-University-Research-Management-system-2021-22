require "sinatra"
require "sqlite3"
post "/create_account" do
  @users = User.new
  #reading in user input for creating an account.
  @username_field = params["username"]
  @email_field = params["email"]
  @institution_field = params["institution"]
  @password_field = params["password"]

  #submit the form if the fields are not empty and the username is not already taken.
  @form_was_submitted = !@username_field.empty? && !@email_field.empty? && !@institution_field.empty? && !@password_field.empty? && (DB[:users].where(username: @username_field)).count == 0

  @submission_error = nil
  @username_validation_error = nil
  @username_error = nil
  @email_error = nil
  @institution_error = nil
  @password_error = nil

  @users.load(params)

  if @form_was_submitted 
    #sanitise the values by removing whitespace
    @username_field.strip!
    @email_field.strip!
    # @institution_field.strip!
    @password_field.strip!
    @users.suspended = "N"
    @users.save_changes
    redirect "/login"
  else
    # now proceed to validation
    @username_error = "Please enter a value for username" if @username_field.empty?
    #If there is at least one entry of the usernamed typed in the database then return the error
    @username_validation_error = "Sorry, This username is not available" if (DB[:users].where(username: @username_field)).count >0
    @email_error = "Please enter a value for email" if @email_field.empty?
    @institution_error = "Please enter a value for institution" if @institution_field.empty?
    @password_error = "Please enter a value for password" if @password_field.empty?
  end

  erb :create_account

end

