class Device < ApplicationRecord
    has_many :automations
    has_many :users
    belongs_to :user_device
    has_many :automations, through: :user_devices
    has_many :users, through: :user_devices

    def user_device_location=(location)
        self.UserDevice = UserDevice.find_or_create_by(location: location)
    end
   
    def user_device_location
         self.UserDevice ? self.UserDevice.location : nil
    end

end
