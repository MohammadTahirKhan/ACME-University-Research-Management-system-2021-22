class Post < Sequel::Model


  def load(params)
    self.poster_name =  params.fetch("poster_name", "").strip
    self.id =  params.fetch("id", "").strip
    self.title =  params.fetch("title", "").strip
    self.topic =  params.fetch("topic", "").strip
    self.institution =  params.fetch("institution", "")
    self.sponsor =  params.fetch("sponsor", "").strip
    self.link =  params.fetch("link", "").strip
    self.content = params.fetch("content", "").strip
    self.approved =  params.fetch("approved", "").strip
    
  end


  
  def self.id_exists?(id)
    return false if id.nil? # check the id is not nil
    return false if Post[id].nil? # check the database has a record with this id

    true # all checks are ok - the id exists
  end
  
  def validate
    super
    errors.add("title", "cannot be empty") if !title || title.empty?
    errors.add("topic", "cannot be empty") if !topic || topic.empty?
    errors.add("institution", "cannot be empty") if !institution || institution.empty?
    errors.add("link", "cannot be empty") if !link || link.empty?
    errors.add("content", "cannot be empty") if !content || content.empty?
  end

end