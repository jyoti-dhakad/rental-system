class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  has_many :feedbacks

  validates :pick_up, :pick_up_time, presence:true
  validates :drop_off, :drop_off_time, presence:true

  enum status: { pending: 0,approved: 1, cancelled: 2 }
end
