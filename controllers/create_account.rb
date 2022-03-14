require "sinatra"
require "sqlite3"
post "/create_account" do
  @users = User.new

  @username_field = params["username"]
  @email_field = params["email"]
  @institution_field = params["institution"]
  @password_field = params["password"]

  @form_was_submitted = !@username_field.empty? && !@email_field.empty? && !@institution_field.empty? && !@password_field.empty?  && (DB[:users].where(username: @username_field)).count == 0
  @submission_error = nil
  @username_validation_error = nil
  @username_error = nil
  @email_error = nil
  @institution_error = nil
  @password_error = nil

  @users.load(params)

  if @form_was_submitted 
    # sanitise the values by removing whitespace
    @username_field.strip!
    @email_field.strip!
    @institution_field.strip!
    @password_field.strip!
    @users.save_changes
    redirect "/login"
  else
    # now proceed to validation
    @username_error = "Please enter a value for username" if @username_field.empty?
    @username_validation_error = "Sorry, This username is not available" if (DB[:users].where(username: @username_field)).count >0
    @email_error = "Please enter a value for email" if @email_field.empty?
    @institution_error = "Please enter a value for institution" if @institution_field.empty?
    @password_error = "Please enter a value for password" if @password_field.empty?

    #@submission_error = "Please correct the errors above" unless 
    #@title_error.nil? && 
    #@topic_error.nil? && 
    #@institution_error.nil? && 
    #@link_error.nil?
  end

  erb :create_account

end