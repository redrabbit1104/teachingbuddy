class Schedule < ApplicationRecord
  belongs_to :sdate
  has_many :checks
end
