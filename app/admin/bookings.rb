ActiveAdmin.register Booking do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pick_up, :drop_off, :pick_up_time, :drop_off_time, :vehicle_id, :status, :user_id
  #
  actions :all, :except => [:new, :destroy, :edit]

  action_item :approve, only: :show do
   
    
    if booking.status? && !resource.approved?
      
     
      link_to 'Approve', "/admin/bookings/#{params[:id]}/approve", method: :put
    end
  end

  action_item :cancel, only: :show do
    
    
    if booking.status? && !resource.approved?
    
      link_to 'Cancel', "/admin/bookings/#{params[:id]}/cancel", method: :put
    end
  end

  member_action :approve, method: :put do
   
    resource.update(status: :approved)
   
    UserMailer.conformation(@booking).deliver_now
    redirect_to admin_bookings_path, notice: "status approved successfully."
  end

  member_action :cancel, method: :put do
    resource.update(status: :Cancelled)
    
    redirect_to admin_bookings_path, notice: "status cancelled successfully."
  end
end
