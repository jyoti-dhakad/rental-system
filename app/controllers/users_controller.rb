class UsersController < ApplicationController
    skip_before_action:verify_authenticity_token

    def index
        if current_user
            @vehicles = Vehicle.all
            render json: @vehicles, each_serializer: VehicleSerializer
        else
            render json: {message:"after login you can see all vehicles!!  thank you!"}
        end
    
    end
    def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
          
        else
          render json: @user.errors
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :phone_number)
    end
      
end
