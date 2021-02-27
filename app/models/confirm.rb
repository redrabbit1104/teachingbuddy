class Confirm < ApplicationRecord
  has_one :user
  belongs_to :admin
  belongs_to :schedule
end
