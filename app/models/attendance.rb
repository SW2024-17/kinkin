class Attendance < ApplicationRecord
  belongs_to :user

  validates :check_in, presence: true
  validates :status, presence: true
end
