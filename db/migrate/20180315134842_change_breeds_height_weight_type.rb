class ChangeBreedsHeightWeightType < ActiveRecord::Migration[5.1]
  def change
    change_column :breeds, :height, :string
    change_column :breeds, :weight, :string
  end
end
