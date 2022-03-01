require "sinatra"

get "/create_post" do
  @post = Post.new
  erb :create_post
end

post "/create_post" do
  @post = Post.new
  @post.load(params)

end