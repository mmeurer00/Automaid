class Automation < ApplicationRecord
    belongs_to :room
    belongs_to :device
    has_one :user, through: :device

    validates :name, :if_action, :then_action, :room_name, presence: true 


    def room_name
        self.try(:room).try(:name)
    end
    
    def room_name=(name)
        room = Room.find_or_create_by(name: name) if !name.blank?
        self.room = room
    end

    
end