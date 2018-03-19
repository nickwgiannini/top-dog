class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates_presence_of :review_id, :user_id, :value
end
