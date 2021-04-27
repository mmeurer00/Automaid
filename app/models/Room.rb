class Room < ApplicationRecord
    belongs_to :user, optional: true
    has_many :automations 
    has_many :devices, through: :automations

    validates :name, presence: true
    
end
