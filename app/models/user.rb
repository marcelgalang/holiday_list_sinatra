class User < ActiveRecord::Base
  has_many :recipients
  has_secure_password

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
