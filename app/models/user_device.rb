class UserDevice < ApplicationRecord
    belongs_to :user
    has_many :automations 
    has_many :devices

    validates :location, :quantity, presence: true
    validates :indoor, inclusion: [true, false]
    validates :outdoor, inclusion: [true, false]
end
