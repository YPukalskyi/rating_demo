class User < ApplicationRecord
  has_many :review_imports

  has_many :feedbacks
  has_many :products, through: :feedbacks # Just in case

  validates :email, presence: true
end
