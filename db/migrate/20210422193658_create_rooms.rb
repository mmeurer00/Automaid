class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :indoor
      t.boolean :outdoor
      
      t.integer :user_id

      t.timestamps
    end
  end
end
