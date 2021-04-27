class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :description
      t.string :quantity
      t.integer :user_id
      
      t.timestamps
    end
  end
end
