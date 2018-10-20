# require 'BCrypt'

class User < ApplicationRecord
  include BCrypt 

  # def authenticate(password)
  # 	self.password == password 
  # end

# BCRYPT
  def password
  	# binding.pry
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
  	@password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
