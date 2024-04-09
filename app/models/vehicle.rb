class Vehicle < ApplicationRecord
    mount_uploader :picture, AvatarUploader
    has_many :bookings
    has_many :users, through: :bookings
    has_many :feedbacks, through: :bookings




    validates :name, :rent_price, presence:true
    validates :insurance,presence:true
    validates :model_number, presence:true, uniqueness:true
    
    
end
