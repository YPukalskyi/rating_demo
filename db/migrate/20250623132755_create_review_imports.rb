class CreateReviewImports < ActiveRecord::Migration[7.2]
  def change
    create_table :review_imports do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
