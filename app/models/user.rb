class User < ActiveRecord::Base
  include Sluggable

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true, length: {maximum: 30}
  validates :password, presence: true, on: :create, length: {minimum: 7}

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end
end
