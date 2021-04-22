class Device < ApplicationRecord
    has_many :automations
    has_many: users
    has_many :users, through: :automations
    
    validates :name, :type, :brand, :location, presence: true
    validates :indoor, inclusion: [true, false]
    validates :indoor, exclusion: [nil]

end
