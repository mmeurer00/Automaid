class Device < ApplicationRecord
    belongs_to :user, optional: true
    has_many :automations
    has_many :rooms, through: :automations

    validates :name, :brand, :description, :quantity, presence: true

end
