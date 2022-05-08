get "/edit_personal_details" do
    id = params["id"]
    @user = User[id] if User.id_exists?(id)
    erb :edit_personal_details
end
  
post "/edit_personal_details" do
    id = params["id"]
    #proceed to edit the user if the user id exist
    if User.id_exists?(id)
        @user = User[id]
        @user.load(params)

        if @user.valid?
            @user.save_changes
            redirect "/logout"
        end
    end

    erb :edit_personal_details 
end