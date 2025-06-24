class Product < ApplicationRecord
  paginates_per 10

  has_many :feedbacks
  has_many :users, through: :feedbacks

  validates :title, presence: true

  # TODO: Must be implementer, as a column
  def average_rating
    feedbacks.average(:rating).to_f.round(1) || 0.0
  end
end
