class Review < ApplicationRecord
  belongs_to :breed
  belongs_to :user

  validates_presence_of :kid_friendly, :dog_friendly, :barking_lvl, :trainability, :energy_lvl

  validates_inclusion_of :kid_friendly, :in => 1..10
  validates_inclusion_of :dog_friendly, :in => 1..10
  validates_inclusion_of :barking_lvl, :in => 1..10
  validates_inclusion_of :trainability, :in => 1..10
  validates_inclusion_of :energy_lvl, :in => 1..10
end
