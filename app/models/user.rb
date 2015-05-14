class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true, length: {maximum: 30}
  validates :password, presence: true, on: :create, length: {minimum: 7}
end
