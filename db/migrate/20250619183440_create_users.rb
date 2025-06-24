class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name,  null: false, default: ''
      t.string :email,      null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
