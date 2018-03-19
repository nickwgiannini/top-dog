class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer "user_id", null: false
      t.integer "review_id", null: false
      t.integer "value", null: false
      t.integer "breed_id"

      t.timestamps
    end
  end
end
