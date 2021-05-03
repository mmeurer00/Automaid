class Room < ApplicationRecord
    belongs_to :user, optional: true
    has_many :automations 
    has_many :devices, through: :automations

    validates :name, presence: true
    scope :filter_by_location, -> (indoor) { where indoor: true }
    
end
