class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user
  has_many :likes
  # validates :user_id, :uniqueness => {:scope => :post_id}

end
