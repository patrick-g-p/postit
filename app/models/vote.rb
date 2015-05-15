class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id", polymorphic: true
  belongs_to :post, polymorphic: true
  belongs_to :comment, polymorphic: true
end
