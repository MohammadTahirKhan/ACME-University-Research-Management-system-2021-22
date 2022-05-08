require "sinatra"

post "/create_post" do
  @posts = Post.new
  #reading in post input for creating a post.
  @title_field = params["title"]
  @topic_field = params["topic"]
  @institution_field = params["institution"]
  @sponsor_field = params["sponsor"]
  @link_field = params["link"]
  @content_field = params["content"]

  #submit the form if the fields are not empty.
  @form_was_submitted = !@title_field.empty? && !@topic_field.empty?  && !@link_field.empty? && !@content_field.empty?
  @submission_error = nil


  @title_error = nil
  @topic_error = nil
  @institution_error = nil
  @link_error = nil
  @content_error = nil

  @posts.load(params)

  if @form_was_submitted
    # sanitise the values by removing whitespace
    @title_field.strip!
    @topic_field.strip!
    @sponsor_field.strip!
    @link_field.strip!
    @content_field.strip!
    @posts.save_changes

    # fill the sponsor as Acme on default if no sponsor is specified
    if @sponsor_field.empty?
      DB[:posts].where(sponsor: @sponsor_field).update(sponsor: "Acme")
    end
    redirect "/create_post"
  else
    # now proceed to validation
    @title_error = "Please enter a value for title" if @title_field.empty?
    @topic_error = "Please enter a value for topic" if @topic_field.empty?
    @link_error = "Please enter a value for link" if @link_field.empty?
    @content_error = "Please enter a value for content" if @content_field.empty?
  end

  erb :create_post

end