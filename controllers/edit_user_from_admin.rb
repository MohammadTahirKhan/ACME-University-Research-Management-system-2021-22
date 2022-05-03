get "/edit_user_from_admin" do
    id = params["id"]
    @user = User[id] if User.id_exists?(id)
    erb :edit_user_from_admin
end
  
post "/edit_user_from_admin" do
    id = params["id"]

    if User.id_exists?(id)
        @user = User[id]
        @user.load(params)

        if @user.valid?
        @user.save_changes
        redirect "/admin"
        end
    end

    erb :edit_user_from_admin 
end