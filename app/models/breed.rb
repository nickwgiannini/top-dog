class Breed < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates_presence_of :name, :life_expectancy, :personality, :shedding, :height, :weight, :grooming, :img_url
end
