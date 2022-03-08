require "sinatra"

get "/create_post" do
  @posts = Post.new
  return erb :create_post

  @title_field = params["title"]
  @topic_field = params["topic"]
  @institution_field = params["institution"]
  @link_field = params["link"]

  @form_was_submitted = !@title_field.nil? || !@topic_field.nil? || !@institution_field.nil? || !@link_field.nil?
  @submission_error = nil

  @title_error = nil
  @topic_error = nil
  @institution_error = nil
  @link_error = nil

  if @form_was_submitted
    # sanitise the values by removing whitespace
    @title_field.strip!
    @topic_field.strip!
    @institution_field.strip!
    @link_field.strip!

    # now proceed to validation
    @title_error = "Please enter a value for title" if @title_field.empty?
    @topic_error = "Please enter a value for topic" if @topic_field.empty?
    @institution_error = "Please enter a value for institution" if @institution_field.empty?
    @link_error = "Please enter a value for link" if @link_field.empty?

    @submission_error = "Please correct the errors below" unless 
    @title_error.nil? && 
    @topic_error.nil? && 
    @institution_error.nil? && 
    @link_error.nil?
  end
end

post "/create_post" do
  @posts = Post.new
  @posts.load(params)

  if @posts.valid?
    @posts.save_changes
    redirect "/home"
  end

  erb :create_post

end