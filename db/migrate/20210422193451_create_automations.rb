class CreateAutomations < ActiveRecord::Migration[6.1]
  def change
    create_table :automations do |t|
      t.string :name
      t.text :if_action
      t.text :then_action
      t.integer :room_id
      t.integer :device_id
      

      t.timestamps
    end
  end
end
