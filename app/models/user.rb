class User < ActiveRecord::Base
  has_many :recipients

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
