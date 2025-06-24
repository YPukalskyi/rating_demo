class Feedback < ApplicationRecord
  MIN_RATING = 1
  MAX_RATING = 5

  belongs_to :user
  belongs_to :product

  validates :rating,
            presence: true,
            numericality: {
              only_integer:             true,
              greater_than_or_equal_to: MIN_RATING,
              less_than_or_equal_to:    MAX_RATING
            }
end
