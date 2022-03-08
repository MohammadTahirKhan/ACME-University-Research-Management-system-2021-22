require "sinatra"

get "/viewer" do
  @posts = Post.all
  erb :viewer
end