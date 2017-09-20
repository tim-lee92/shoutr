class Shout < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true, length: { in: 1..144 }
  validates :user, presence: true
end
