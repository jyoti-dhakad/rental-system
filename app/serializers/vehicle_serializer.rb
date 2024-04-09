
class VehicleSerializer < ActiveModel::Serializer
  

  attributes :id, :name, :picture, :model_number, :rent_price, :insurance

  
end