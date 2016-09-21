class User < ActiveRecord::Base
  has_many :recipients
  has_secure_password

end
