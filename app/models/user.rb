class User < ApplicationRecord
  has_secure_password
  has_many :rooms
  has_many :devices
  has_many :automations, through: :devices

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }
  validates :name, length: { in: 1..20 }
end
