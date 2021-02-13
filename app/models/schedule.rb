class Schedule < ApplicationRecord
  belongs_to :sdate
  has_many :checks
  has_many :schedule_users
  has_many :users, through:schedule_users
end
