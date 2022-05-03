require "sinatra"

get "/viewer" do


  # @post_search = params.fetch("post_search", "").strip
  # @post = Post.where(Sequel.like(:approved, "Approved"))
  # shows the result according to the search bar 
    # @posts = if @post_search.empty? 
    #   @post.all
    # else
    #   @post.where(Sequel.like(:institution, "%#{@post_search}%" ))
    # end
  @post_search1 = params.fetch("post_search1", "").strip
  @post_search2 = params.fetch("post_search2", "").strip
  @post_search3 = params.fetch("post_search3", "").strip
  @post = Post.where(Sequel.like(:approved, "Approved"))
  # shows the result according to the search bar 
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


  erb :viewer
end

post "/delete" do
  id = params["id"]

    post = Post[id]
    post.delete

  erb :delete
end

