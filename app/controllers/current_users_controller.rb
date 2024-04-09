class CurrentUsersController < ApplicationController

    def index
        if current_user
            @user = current_user
            render json: @user
        else
            render json: {message:"after login you can see your profile!!"}
        end 
    end
    
end
