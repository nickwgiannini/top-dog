class CreateBreeds < ActiveRecord::Migration[5.1]
  def change
    create_table :breeds do |t|
      t.string :name, null: false
      t.integer :life_expectancy, null: false
      t.string :personality, null: false
      t.string :shedding, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.string :grooming, null: false
      t.string :img_url, null: false
      t.integer :kid_friendly_avg
      t.integer :dog_friendly_avg
      t.integer :barking_lvl_avg
      t.integer :trainability_avg
      t.integer :energy_lvl_avg
    end
  end
end
