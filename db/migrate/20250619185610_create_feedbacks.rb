class CreateFeedbacks < ActiveRecord::Migration[7.2]
  def change
    create_table :feedbacks do |t|
      t.integer :rating, null: false
      t.text    :comment

      t.references :user,    null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :feedbacks, :rating
  end
end
