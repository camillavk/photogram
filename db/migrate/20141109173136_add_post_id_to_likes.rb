class AddPostIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :post, index: true
  end
end
