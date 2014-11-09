class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :likes
  belongs_to :user
  has_attached_file :image, :styles => {
    :medium => '600x600>',
    :thumb => '300x300>'},
    :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates :image, presence: true

  def newest_comments
    self.comments.order('created_at DESC').per_page(3)
  end

end
