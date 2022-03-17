require "sinatra"

get "/" do
  #redirect the user to the home page only if they are logged in
  redirect "/login" unless session[:logged_in]
  erb :home
end

get "/login" do
  @users = User.new
  erb :login
end
  
post "/login" do
  @users = User.new
  @users.load(params)
  @error = nil
  
  #if the entry is valid and it exists in the database then redirect the user to the home page
  #otherwise return appropriate errors
  if @users.valid?
    if @users.exist?
      session[:logged_in] = true
      redirect "/"
    else
      @error = "Username/Password combination incorrect"
    end
  else
    @error = "Please correct the information below"
  end
  
  erb :login
end
  
get "/logout" do
  session.clear
  erb :logout
end
  