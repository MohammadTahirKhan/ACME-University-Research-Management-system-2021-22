require "sinatra"

post "/moderator" do
  #Approve a post
  id = params["id"]

  post = Post[id]
  post.update(:approved => "Approved") 

  erb :approved
end

post "/delete" do
  #disapprove a post
  id = params["id"]

  post = Post[id]
  post.delete

  erb :delete
end

get "/moderator" do

  @post_search1 = params.fetch("post_search1", "").strip
  @post_search2 = params.fetch("post_search2", "").strip
  @post_search3 = params.fetch("post_search3", "").strip
  # moderator page only has posts that are pending or that are not yet approved
  @post = Post.where(Sequel.like(:approved, "Not Approved"))
  # shows the result according to the filters 
  if @post_search1.empty? && @post_search2.empty? && @post_search3.empty?
    @posts = @post.all
  end
  if !@post_search1.empty? && @post_search2.empty? && @post_search3.empty?
    @posts = @post.where(Sequel.like(:institution, "%#{@post_search1}%" ))
  end
  if @post_search1.empty? && !@post_search2.empty? && @post_search3.empty?
    @posts = @post.where(Sequel.like(:topic, "%#{@post_search2}%" ))
  end
  if @post_search1.empty? && @post_search2.empty? && !@post_search3.empty?
    @posts = @post.where(Sequel.like(:sponsor, "%#{@post_search3}%" ))
  end
  if !@post_search1.empty? && !@post_search2.empty? && @post_search3.empty?
    @postt = @post.where(Sequel.like(:institution, "%#{@post_search1}%"))
    @posts = @postt.where(Sequel.like(:topic, "%#{@post_search2}%"))
  end
  if !@post_search1.empty? && @post_search2.empty? && !@post_search3.empty?
    @postt = @post.where(Sequel.like(:institution, "%#{@post_search1}%"))
    @posts = @postt.where(Sequel.like(:sponsor, "%#{@post_search3}%"))
  end
  if @post_search1.empty? && !@post_search2.empty? && !@post_search3.empty?
    @postt = @post.where(Sequel.like(:topic, "%#{@post_search2}%"))
    @posts = @postt.where(Sequel.like(:sponsor, "%#{@post_search3}%"))
  end
  if !@post_search1.empty? && !@post_search2.empty? && !@post_search3.empty?
    @postt = @post.where(Sequel.like(:institution, "%#{@post_search1}%"))
    @posttt = @postt.where(Sequel.like(:topic, "%#{@post_search2}%"))
    @posts = @posttt.where(Sequel.like(:sponsor, "%#{@post_search3}%"))
  end
  erb :moderator
end

