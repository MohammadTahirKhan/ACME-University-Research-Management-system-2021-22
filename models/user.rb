require 'bcrypt'

class User < Sequel::Model

  def load(params)
    self.id =  params.fetch("id", "").strip
    self.username =  params.fetch("username", "").strip
    self.email =  params.fetch("email", "").strip
    self.user_type =  params.fetch("user_type", "").strip
    self.institution =  params.fetch("institution", "")
    self.password =  params.fetch("password", "").strip
    self.password = BCrypt::Password.create(password) unless password.empty?
    self.suspended = params.fetch("suspended", "").strip
    self.password_reset = params.fetch("password_reset", "").strip
  end

  def login_load(params)
    self.username =  params.fetch("username", "").strip
    self.password =  params.fetch("password", "").strip
  end

  def validate
    super
    errors.add("username", "cannot be empty") if username.empty?
    errors.add("password", "cannot be empty") if password.empty?
  end

  def exist?
    other_user = User.first(username: username)
    puts(other_user.password)
    puts(self.password)
    puts(self.password == other_user.password)
    puts(BCrypt::Password.new(other_user.password))
    puts(BCrypt::Password.new(other_user.password) == password)

    !other_user.nil? && BCrypt::Password.new(other_user.password) == password
  end

  def is_viewer?
    other_user = User.first(username: username)
    !other_user.nil? && BCrypt::Password.new(other_user.password) == password && other_user.user_type == "viewer"
  end

  def is_moderator?
    other_user = User.first(username: username)
    !other_user.nil? && BCrypt::Password.new(other_user.password) == password && other_user.user_type == "moderator"
  end

  def is_admin?
    other_user = User.first(username: username)
    !other_user.nil? && BCrypt::Password.new(other_user.password) == password && other_user.user_type == "admin"
  end

  def not_suspended?
    other_user = User.first(username: username)

    !other_user.nil? && BCrypt::Password.new(other_user.password) == password && other_user.suspended == "N"
  end

  def self.id_exists?(id)
    return false if id.nil? # check the id is not nil
    return false if User[id].nil? # check the database has a record with this id

    true # all checks are ok - the id exists
  end
  
  # def validate
  #   super
  #   errors.add("username", "cannot be empty") if !username || username.empty?
  #   errors.add("email", "cannot be empty") if !email || email.empty?
  #   errors.add("user_type", "cannot be empty") if !user_type || user_type.empty?
  #   errors.add("institution", "cannot be empty") if !institution || institution.empty?
  #   errors.add("password", "cannot be empty") if !password || password.empty?
  # end
end
