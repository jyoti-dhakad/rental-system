class FeedbacksController < ApplicationController

    skip_before_action:verify_authenticity_token

    def index
     
        if current_user
          @feedbacks = current_user.feedbacks.all
          render json: @feedbacks, each_serializer: FeedbackSerializer
        else
          render json: {message:"after login you can see your feedbacks!!  thank you!"}
        end
    end


    def create
        if current_user
          @feedback = current_user.feedbacks.build(feedback_params)
          
          if @feedback.save
            render json: @feedback, each_serializer: FeedbackSerializer
          else
            render json: {error: @feedback.errors}
          end
        else
          render json: {message:"after login you can create feedback for vehicle!!  thank you!"}
        end
    end


    private
    def feedback_params
        params.require(:feedback).permit(:rating, :comment, :booking_id)
    end
end
