class Administrator < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :username
  has_secure_password
end
