get "/profile" do

  @user_search = params.fetch("user_search", "").strip

  @users = if @user_search.empty?
    User.all
  else
    User.where(Sequel.like(:username, "%#{@user_search}%"))
  end

  @post_search = params.fetch("post_search", "").strip

  @posts = if @post_search.empty?
    Post.all
  else
    Post.where(Sequel.like(:poster_name, "%#{@post_search}%"))
  end
  
  erb :profile
end