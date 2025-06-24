class ReviewImport < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  validates :file, attached: true,
                   content_type: ["text/csv"],
                   size: { less_than: 1.gigabyte }
end
