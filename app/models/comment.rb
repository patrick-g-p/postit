class Comment < ActiveRecord::Base
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  belongs_to :post
  has_many :votes, as: :voteable

  validates :body, presence: true, allow_blank: false

  def total_number_of_votes
    self.upvotes - self.downvotes
  end

  def upvotes
    self.votes.where(vote: true).size
  end

  def downvotes
    self.votes.where(vote: false).size
  end
end
