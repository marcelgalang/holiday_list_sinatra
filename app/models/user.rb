class User < ActiveRecord::Base
  has_many :recipients
  has_secure_password
  validates_presence_of :username, presence: { message: "A username must be given please." }
  validates :username, uniqueness: true
  validates_presence_of :password, presence: { message: "A password must be given please." }
end
