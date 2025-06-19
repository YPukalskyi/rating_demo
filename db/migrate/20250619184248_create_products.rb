class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.text    :description
      t.string  :title, null: false
      t.decimal :price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end

    add_index :products, :title
  end
end
