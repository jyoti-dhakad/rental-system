class BookingSerializer < ActiveModel::Serializer
  attributes :id, :pick_up, :pick_up_time, :drop_off, :drop_off_time, :status, :created_at, :total_rent
  belongs_to :vehicle, serializer: VehicleSerializer
  
end
