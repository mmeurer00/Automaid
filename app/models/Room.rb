class Room < ApplicationRecord
    belongs_to :user
    has_many :automations 
    has_many :devices, through: :automations

    validates :name, presence: true
    
end
