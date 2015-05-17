class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true
  validates :name, uniqueness: true

  before_save :generate_slug!

  def generate_slug!
    the_slug = to_slug(self.name)
    category = Category.find_by(slug: the_slug)

    count = 2
    while category && category != self
      the_slug = append_suffix(the_slug, count)
      category = Category.find_by(slug: the_slug)
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
