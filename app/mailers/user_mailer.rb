class UserMailer < ApplicationMailer
    # def conformation(booking)
       
    #     @booking = booking
    #     mail(to: @booking.email, subject: 'Booking Confirmation!')
    # end
    def conformation(booking)
        @booking = booking
        
        mail(to: @booking.user.email, subject: "Vehicle Booking Confirmation")
    end

end
