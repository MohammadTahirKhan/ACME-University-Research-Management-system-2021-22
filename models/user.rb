class User < Sequel::Model

  def load(params)
    self.id =  params.fetch("id", "").strip
    self.username =  params.fetch("username", "").strip
    self.email =  params.fetch("email", "").strip
    self.user_type =  params.fetch("user_type", "").strip
    self.institution =  params.fetch("institution", "").strip
    self.password =  params.fetch("password", "").strip
  end

  def validate
    super
    errors.add("username", "cannot be empty") if username.empty?
    errors.add("password", "cannot be empty") if password.empty?
  end

  def exist?
    other_user = User.first(username: username)
    !other_user.nil? && other_user.password == password
  end
end
