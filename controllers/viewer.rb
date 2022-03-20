require "sinatra"

get "/viewer" do

  @post_search = params.fetch("post_search", "").strip

  # shows the result according to the search bar 
  @posts = if @post_search.empty?
    Post.all
  else
    Post.where(Sequel.like(:institution, "%#{@post_search}%"))
  end

  erb :viewer
end