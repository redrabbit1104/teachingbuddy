class Check < ApplicationRecord
  belongs_to :schedule
  has_many :user_checks
  has_many :users, through: :user_checks
  # has_one :user_check
  # has_one :user, through: :user_check
end