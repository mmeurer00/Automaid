class Automation < ApplicationRecord
    belongs_to :user_device
    belongs_to :device

    validates :name, :if_action, :then_action, presence: true
end