require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /index" do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      get '/bookings'
      expect(response).to be_successful
    end
    it 'returns a unsuccessful response' do
      user = FactoryBot.create(:user)
      get logout_path
      get  '/bookings'
      expect(response.body).to eq({ message: 'after login you can see your booking!!  thank you!' }.to_json)
    
    end
  end

  describe 'POST #create' do
    it 'create  booking data' do
      # vehicle = FactoryBot.create(:vehicle)
      user_params = FactoryBot.attributes_for(:booking)
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      
      post '/bookings/',params: { booking: user_params }
      expect(response.status).to eq 200
    end  
  end

  describe 'POST #create' do
    it 'returns a unsuccessful response' do
      
      user = FactoryBot.create(:user)
      get logout_path
     
      user_params = FactoryBot.attributes_for(:booking)
      post '/bookings/',params: { booking: user_params }
      expect(response.body).to eq({ message: 'You must be logged in to create a booking for a vehicle. Thank you!' }.to_json)
    end  
  end

  describe 'PUT #update' do
    it 'update  booking data' do
      booking = FactoryBot.create(:booking)
      user_params = FactoryBot.attributes_for(:booking)
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      
      # put '/bookings/:id',params: { booking: user_params }
      put "/bookings/#{booking.id}/",params: { booking: user_params }
      expect(response.status).to eq 200
    end  
  end

  describe 'PUT #update' do
    it 'returns a unsuccessful response' do
      booking = FactoryBot.create(:booking)
      
      user = FactoryBot.create(:user)
      get logout_path
     
      user_params = FactoryBot.attributes_for(:booking)
      put "/bookings/#{booking.id}/",params: { booking: user_params }
      
      expect(response.body).to eq({ message: 'You must be logged in to update a booking for a vehicle. Thank you!' }.to_json)
    end  
  end
end
