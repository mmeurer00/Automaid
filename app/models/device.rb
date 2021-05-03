class Device < ApplicationRecord
    belongs_to :user
    has_many :automations
    has_many :rooms, through: :automations

    validates :name, :brand, :description, :quantity, presence: true
    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%").length > 0 }
end
