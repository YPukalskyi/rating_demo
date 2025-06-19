class ChangeDefaultRatingInFeedbacks < ActiveRecord::Migration[7.2]
  def change
    change_column_default :feedbacks, :rating, 5
  end
end
