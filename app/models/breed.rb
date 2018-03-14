class Breed < ApplicationRecord
  has_many :reviews
  has_many :users

  validates_presence_of :name, :life_expectancy, :personality, :shedding, :height, :weight, :grooming, :img_url
end
