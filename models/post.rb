class Post < Sequel::Model

  def load(params)
    self.poster_name =  params.fetch("poster_name", "").strip
    self.id =  params.fetch("id", "").strip
    self.title =  params.fetch("title", "").strip
    self.topic =  params.fetch("topic", "").strip
    self.institution =  params.fetch("institution", "").strip
    self.sponsor =  params.fetch("sponsor", "").strip
    self.link =  params.fetch("link", "").strip
    self.content = params.fetch("content", "").strip
    self.approved =  params.fetch("approved", "").strip
    
  end

end