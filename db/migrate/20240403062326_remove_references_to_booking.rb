class RemoveReferencesToBooking < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookings, :user, foreign_key: true
  end
end
