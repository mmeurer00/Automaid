class CreateAutomations < ActiveRecord::Migration[6.1]
  def change
    create_table :automations do |t|
      t.string :name
      t.text :if_action
      t.text :then_action
      t.integer :user_device_id
     

      t.timestamps
    end
  end
end
