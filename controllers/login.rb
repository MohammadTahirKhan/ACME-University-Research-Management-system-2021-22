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
  @users.login_load(params)
  @error = nil
  
  #if the entry is valid, it exists in the database and is not suspended then redirect the user to the home page
  #otherwise return appropriate errors
  if @users.valid?
    if @users.exist? 
      if @users.not_suspended?
        session[:logged_in] = true
        session[:username] = @users.username
        session[:user] = @users.email
        session[:institution] = @users.institution
        session[:password] = @users.password
        
        if @users.is_admin?
          session[:is_admin] = true
        end
      
        if @users.is_moderator?
          session[:is_moderator] = true
        end
      
        if @users.is_viewer?
          session[:is_viewer] = true
        end
    
        redirect "/"
      else
        @error = "User is suspended"
      end
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
  