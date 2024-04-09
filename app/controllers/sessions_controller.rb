class SessionsController < ApplicationController

    skip_before_action:verify_authenticity_token

    def create
        @user = User.find_by(email: user_params[:email])
        if @user && @user.password_digest == user_params[:password]
          cookies[:user_id] = @user.id
          render json: {message:"login successfull"}
        else
            render json: {error:"something went wrong"}
        end
    end
    def destroy
      
        cookies.delete(:user_id)
        flash[:notice] = "You have been logged out."
        render json: {message:"logout successfully"}
    end

    private
    def user_params
        params.require(:user).permit(:email,:password)
    end
end
