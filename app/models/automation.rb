class Automation < ApplicationRecord
    belongs_to :room
    belongs_to :device
    has_one :user, through: :device

    validates :name, :if_action, :then_action, :room_id, presence: true 
    
end