class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_one :admin_room
  # has_many :room_admins, dependent: :destroy
  # has_many :admin_rooms, through: :room_admins
  has_many :admin_messages
  has_many :messages, dependent: :destroy
  has_many :boards
  has_one :schedule
  has_many :user_checks
  has_many :checks, through: :user_checks
end
