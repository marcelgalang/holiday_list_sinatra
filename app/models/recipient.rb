class Recipient < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, presence: { message: "A name must be given please" }

end
