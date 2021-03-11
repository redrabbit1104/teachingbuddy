class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  # has_many :room_admins, dependent: :destroy
  # has_many :admin_rooms, through: :room_admins
  has_many :admin_rooms
  has_many :admin_messages, dependent: :destroy
  has_many :schedule_admins
  has_many :schedules, through: :schedule_admins
  has_many :boards
end
