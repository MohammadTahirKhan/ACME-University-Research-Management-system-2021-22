class Post < Sequel::Model

  #def id 
  #  id
  #end

  #def title
  #  title
  #end

  #def topic
  #  topic
  #end

  #def institution
  #  institution
  #end

  #def link
  #  link
  #end

  def load(params)
    self.id =  params.fetch("id", "").strip
    self.title =  params.fetch("title", "").strip
    self.topic =  params.fetch("topic", "").strip
    self.institution =  params.fetch("institution", "").strip
    self.link =  params.fetch("link", "").strip
  end

end