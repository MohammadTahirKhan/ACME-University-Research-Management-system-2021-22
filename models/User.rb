class User < Sequel::Model

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
    self.user_type =  params.fetch("user_type", "").strip
    self.institution =  params.fetch("institution", "").strip
    self.password =  params.fetch("password", "").strip
  end

end