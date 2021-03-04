class Check < ApplicationRecord
  belongs_to :schedule
  has_many :user_checks
  has_many :users, through: :user_checks
end