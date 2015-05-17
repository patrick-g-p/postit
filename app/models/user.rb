class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true, length: {maximum: 30}
  validates :password, presence: true, on: :create, length: {minimum: 7}

  before_save :generate_slug

  def generate_slug
    self.slug = self.username.gsub(/[^0-9a-zA-Z]/, '_').downcase
  end

  def to_param
    self.slug
  end
end
