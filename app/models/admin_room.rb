class AdminRoom < ApplicationRecord
  # has_many :room_admins
  # has_many :admins, through: :room_admins
  # has_many :users, through: :room_admins
  has_many :admin_messages, dependent: :destroy
  belongs_to :user
  belongs_to :admin
end
