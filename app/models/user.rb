class User < ApplicationRecord
  has_secure_password
  has_many :automations
  has_many :devices
  has_many :devices, through: :automations

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }
  validates :name, length: { in: 2..20 }
end
