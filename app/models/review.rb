class Review < ApplicationRecord
  belongs_to :breed
  belongs_to :user

  validates_presence_of :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl
  validates_inclusion_of :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl, :in => 1..10
end
