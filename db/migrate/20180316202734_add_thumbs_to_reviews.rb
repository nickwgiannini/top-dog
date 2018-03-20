class AddThumbsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :thumbs_up_count, :integer, null: false, default: 0
    add_column :reviews, :thumbs_down_count, :integer, null: false, default: 0
  end
end
