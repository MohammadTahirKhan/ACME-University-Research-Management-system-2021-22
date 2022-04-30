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
  # @post_search1 = params.fetch("post_search1", "").strip
  # @post_search2 = params.fetch("post_search2", "").strip
  # @post = Post.where(Sequel.like(:approved, "Approved"))
  # # shows the result according to the search bar 
  #   @posts = if @post_search1.empty? && @post_search2.empty?
  #     @post.all
  #   end
  #   @posts =  if !@post_search1.empty? && @post_search2.empty?
  #     @post.where(Sequel.like(:institution, "%#{@post_search1}%" ))
  #   end
  #   @posts = if @post_search1.empty? && !@post_search2.empty?
  #     @post.where(Sequel.like(:topic, "%#{@post_search2}%" ))
  #   end
  #   @posts = if !@post_search1.empty? && !@post_search2.empty?
  #     @post1 = @post.where(Sequel.like(:institution, "%#{@post_search1}%"))
  #     @post2 = @post1.where(Sequel.like(:topic, "%#{@post_search2}%"))
  #   end


  erb :viewer
end


