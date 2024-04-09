class BookingsController < ApplicationController
  skip_before_action:verify_authenticity_token

  
  
  
  def index
   
    if current_user
      @bookings = current_user.bookings.all
      render json: @bookings, each_serializer: BookingSerializer
    else
      render json: {message:"after login you can see your booking!!  thank you!"}
    end
  end

  def current_booking
    if current_user
      @booking = Booking.last
      render json: @booking, each_serializer: BookingSerializer
    else
      render json: {message:"after login you can see your current booking!!  thank you!"}
    end 
  end
  

 
  def create
    if current_user
      @booking = current_user.bookings.build(booking_params)
      calculate_rent 
  
      if @booking.save
        
        render json: @booking, each_serializer: BookingSerializer
      else
        
        render json: { errors: @booking.errors.full_messages }
      end
    else
      render json: { message: "You must be logged in to create a booking for a vehicle. Thank you!" }
    end
  end

  def update
    if current_user
      @booking = Booking.find(params[:id])
      if @booking.update(booking_params)
        calculate_rent 
        render json: @booking
      else
        render json: {error: @booking.errors}
      end
    else
      render json: { message: "You must be logged in to update a booking for a vehicle. Thank you!" }
    end

  end

  
  private
  def booking_params
    params.require(:booking).permit(:pick_up, :pick_up_time, :drop_off, :drop_off_time, :vehicle_id, :total_rent)
  end

  def calculate_rent
    vehicle = Vehicle.find(params[:booking][:vehicle_id])
   
  
    start_time = Time.zone.parse("#{params[:booking][:pick_up]} #{params[:booking][:pick_up_time]}")
    end_time = Time.zone.parse("#{params[:booking][:drop_off]} #{params[:booking][:drop_off_time]}")
  
    duration_in_seconds = end_time - start_time
    duration_in_hours = (duration_in_seconds.to_f / 3600).ceil
  
    @booking.total_rent = duration_in_hours * vehicle.rent_price
  
  end

  
end
