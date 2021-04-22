class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.string :rooom
      t.boolean :indoor
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
