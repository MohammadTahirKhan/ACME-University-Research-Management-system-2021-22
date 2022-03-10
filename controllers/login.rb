get "/" do
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
  