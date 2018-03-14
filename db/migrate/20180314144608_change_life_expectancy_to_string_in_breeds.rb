class ChangeLifeExpectancyToStringInBreeds < ActiveRecord::Migration[5.1]
  def change
    change_column :breeds, :life_expectancy, :string
  end
end
