class AddUserToBreedsTable < ActiveRecord::Migration[5.1]
  def self.up
    add_reference :breeds, :user, foreign_key: true
  end

  def self.down
    remove_reference :breeds, :user, foreign_key: true

  end
end
