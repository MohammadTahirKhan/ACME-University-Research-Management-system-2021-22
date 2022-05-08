get "/edit_from_mod_page" do
    id = params["id"]
    @post = Post[id] if Post.id_exists?(id)
    erb :edit_post
end
  
post "/edit_from_mod_page" do
    id = params["id"]
    #proceed to edit the post if the post id exist
    if Post.id_exists?(id)
        @post = Post[id]
        @post.load(params)

        if @post.valid?
            @post.save_changes
            redirect "/moderator"
        end
    end

    erb :edit_post  
end
  