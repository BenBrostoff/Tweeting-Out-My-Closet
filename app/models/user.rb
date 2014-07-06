class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}
  validates :name, presence: true, uniqueness: true

  has_many :tweets
  has_many :votes

end

