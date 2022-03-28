require "sinatra"

post "/moderator" do

    id = params["id"]

    post = Post[id]
    post.update(:approved => "Approved") 

    erb :approved
end

post "/delete" do
  id = params["id"]

    post = Post[id]
    post.delete

  erb :delete
end

get "/moderator" do

    @posts = Post.where(Sequel.like(:approved, "Not Approved"))
    @post_search = params.fetch("post_search", "").strip
  # shows the result according to the search bar 
    @posts = if @post_search.empty?
      @posts.all
    else
      @posts.where(Sequel.like(:institution, "%#{@post_search}%" ))
    end
  erb :moderator
end

