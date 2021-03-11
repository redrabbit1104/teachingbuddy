class AdminMessage < ApplicationRecord
  belongs_to :admin_room
  belongs_to :user
  belongs_to :admin
  has_one_attached :image
end