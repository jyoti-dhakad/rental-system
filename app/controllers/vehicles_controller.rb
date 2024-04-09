class VehiclesController < ApplicationController
    def index
       
        
        @vehicles = Vehicle.all
        render json: @vehicles, each_serializer: VehicleSerializer
        
    end
      
        
   

    def show
        @vehicle = Vehicle.find_by(id: params[:id])
        render json: @vehicle
    end

    
    
end