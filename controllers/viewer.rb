require "sinatra"

get "/viewer" do

  @post_search = params.fetch("post_search", "").strip
  @post = Post.where(Sequel.like(:approved, "Approved"))
  # shows the result according to the search bar 
    @posts = if @post_search.empty?
      @post.all
    else
      @post.where(Sequel.like(:institution, "%#{@post_search}%" ))
    end

  erb :viewer
end