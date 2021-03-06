class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 3}
  has_secure_password validations: false
end
