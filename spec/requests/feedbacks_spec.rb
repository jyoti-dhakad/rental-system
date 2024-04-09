require 'rails_helper'

RSpec.describe "Feedbacks", type: :request do
  
 


  


  describe 'POST #create' do
    it 'create  feedback data' do
      user_params = FactoryBot.attributes_for(:feedback)
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      
      post '/feedbacks/',params: { feedback: user_params }
      expect(response.status).to eq 200
    end  
  end

  describe 'POST #create' do
    it 'returns a unsuccessful response' do
      
      user = FactoryBot.create(:user)
      get logout_path
     
      user_params = FactoryBot.attributes_for(:feedback)
      post '/feedbacks/',params: { feedback: user_params }
      expect(response.body).to eq({ message: 'after login you can create feedback for vehicle!!  thank you!' }.to_json)
    end  
  end

  

  
  describe "GET /index" do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      get '/feedbacks'
      expect(response).to be_successful
    end
    it 'returns a unsuccessful response' do
      user = FactoryBot.create(:user)
      get logout_path
      get  '/feedbacks'
      expect(response.body).to eq({ message: 'after login you can see your feedbacks!!  thank you!' }.to_json)
    
    end
  end

end
