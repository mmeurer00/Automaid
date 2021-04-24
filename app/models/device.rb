class Device < ApplicationRecord
    has_many :automations
    has_many :users
    has_many :automations, through: :user_devices
    has_many :users, through: :user_devices


end
