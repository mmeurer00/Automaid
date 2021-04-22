class CreateAutomations < ActiveRecord::Migration[6.1]
  def change
    create_table :automations do |t|
      t.integer :user_device_id

      t.timestamps
    end
  end
end
