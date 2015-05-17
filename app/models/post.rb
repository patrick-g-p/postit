class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category_ids, presence: true

  before_save :generate_slug

  def total_number_of_votes
    self.upvotes - self.downvotes
  end

  def upvotes
    self.votes.where(vote: true).size
  end

  def downvotes
    self.votes.where(vote: false).size
  end

  def generate_slug
    self.slug = self.title.gsub(/[^0-9a-zA-Z]/, '_').downcase
  end

  def to_param
    self.slug
  end
end
