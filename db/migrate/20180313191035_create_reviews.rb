class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :breed
      t.belongs_to :user
      t.integer :kid_friendly, null: false
      t.integer :dog_friendly, null: false
      t.integer :barking_lvl, null: false
      t.integer :trainability, null: false
      t.integer :energy_lvl, null: false
      t.string :body

      t.timestamps
    end
  end
end
