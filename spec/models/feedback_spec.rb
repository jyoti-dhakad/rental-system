require 'rails_helper'

RSpec.describe Feedback, type: :model do
    it 'is valid with valid attributes' do
        feedback = FactoryBot.create(:feedback)
        expect(feedback).to be_valid
      end
    
      it 'is valid with valid attributes' do
        feedback = Feedback.create(rating:"star_1")
        expect(feedback).to_not be_valid
      end
    
    
end
