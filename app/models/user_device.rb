class UserDevice < ApplicationRecord
    belongs_to :user
    belongs_to :device
    has_many :automations 

    validates :location, :quantity, presence: true
    validates :indoor, inclusion: [true, false]
    validates :outdoor, inclusion: [true, false]
end
