class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment
  belongs_to :booking, serializer: BookingSerializer
end
