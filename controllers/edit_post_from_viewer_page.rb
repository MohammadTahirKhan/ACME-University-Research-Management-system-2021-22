get "/edit_from_viewer_page" do
    id = params["id"]
    @post = Post[id] if Post.id_exists?(id)
    erb :edit_post
end
  
post "/edit_from_viewer_page" do
    id = params["id"]

    if Post.id_exists?(id)
        @post = Post[id]
        @post.load(params)

        if @post.valid?
        @post.save_changes
        redirect "/viewer"
        end
    end

    erb :edit_post  
end