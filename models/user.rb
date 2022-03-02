class User < sequel :: Model

  def id 
    id
  end

  def username
    username
  end

  def user_type
    user_type
  end

  def institution
    institution
  end

  def password
    password
  end

  def load(params)
    self.id =  params.fetch("id", "").strip
    self.username =  params.fetch("username", "").strip
    self.id =  params.fetch("id", "").strip
    self.id =  params.fetch("id", "").strip
    self.id =  params.fetch("id", "").strip

end