require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!

  include BCrypt
  
  has_secure_password

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end




  has_many :posts
  has_many :comments
end
