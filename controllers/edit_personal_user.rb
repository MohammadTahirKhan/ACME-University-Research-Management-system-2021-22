get "/edit_personal_user" do
    id = params["id"]
    @user = User[id] if User.id_exists?(id)
    erb :edit_personal_user
end
  
post "/edit_personal_user" do
    id = params["id"]

    if User.id_exists?(id)
        @user = User[id]
        @user.load(params)

        if @user.valid?
        @user.save_changes
        redirect "/profile"
        end
    end

    erb :edit_personal_user 
end