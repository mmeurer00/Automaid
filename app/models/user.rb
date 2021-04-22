class User < ApplicationRecord
  has_secure_password
  has_many :user_devices
  has_many :automations, through: :user_devices
  has_many :devices, through: :user_devices

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }
  validates :name, length: { in: 2..20 }
end
