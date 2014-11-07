class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :comment, index: true

      t.timestamps
    end
  end
end
