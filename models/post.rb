class Post < Sequel::Model

  def load(params)
    self.id =  params.fetch("id", "").strip
    self.title =  params.fetch("title", "").strip
    self.topic =  params.fetch("topic", "").strip
    self.institution =  params.fetch("institution", "").strip
    self.link =  params.fetch("link", "").strip
    self.approved =  params.fetch("approved", "").strip
  end

end