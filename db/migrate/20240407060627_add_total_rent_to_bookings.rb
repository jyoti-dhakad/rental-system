class AddTotalRentToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :total_rent, :float
   
  end
end
