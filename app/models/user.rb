class User < ApplicationRecord
    has_secure_password
    
    validates :first_name, :last_name, presence:true
    validates :phone_number, presence:true
    validates :password_digest, presence:true
    validates :email, presence:true, uniqueness:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

    has_many :bookings
    has_many :vehicles, through: :bookings
    has_many :feedbacks

    def login
        email
    end
end
