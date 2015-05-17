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

  before_save :generate_slug!

  def total_number_of_votes
    self.upvotes - self.downvotes
  end

  def upvotes
    self.votes.where(vote: true).size
  end

  def downvotes
    self.votes.where(vote: false).size
  end

  def generate_slug!
    the_slug = to_slug(self.title)
    post = Post.find_by(slug: the_slug)

    count = 2
    while post && post != self
      the_slug = append_suffix(the_slug, count)
      post = Post.find_by(slug: the_slug)
      count += 1
    end

    self.slug = the_slug
  end

  def append_suffix(string, count)
    if string.split("_").last.to_i != 0
      return string.split("_").slice(0...-1).join("_") + "_#{count}"
    else
      return string + "_#{count}"
    end
  end

  def to_slug(title)
    string = title.strip
    string.gsub!(/\s*[^0-9a-zA-Z]\s*/, "_")
    string.gsub!(/_+/, "_")
    string.downcase
  end

  def to_param
    self.slug
  end
end
