require 'rails_helper'

RSpec.describe "Users", type: :request do
  

  describe 'POST #create' do
    it 'create  user data' do
      user_params = FactoryBot.attributes_for(:user)
      
      post '/users/',params: { user: user_params }
      expect(response.status).to eq 200
    end 
    it 'renders the user as JSON' do
      user_params = FactoryBot.attributes_for(:user)
      
      post  '/users/',params: { user: user_params }
      user = User.last
      expect(response.body).to eq(user.to_json)
    end
  end

  


  describe "GET /index" do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      get '/users'
      expect(response).to be_successful
    end
    it 'returns a unsuccessful response' do
      user = FactoryBot.create(:user)
      get logout_path
      get  '/users'
      expect(response.body).to eq({ message: 'after login you can see all vehicles!!  thank you!' }.to_json)
    
    end
  end

  # describe "POST 'create'" do
  #   it "should create a session for the user" do
  #     user = FactoryBot.create(:user)
      
  #     post login_path, params: { user: { email: user.email, password: user.password_digest } }
      
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
