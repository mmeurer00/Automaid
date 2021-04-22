class CreateUserDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :user_devices do |t|
      t.string :location
      t.boolean :indoor
      t.boolean :outdoor
      t.integer :user_id
      t.integer :device_id

      t.timestamps
    end
  end
end
