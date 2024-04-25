require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user_params) { FactoryBot.attributes_for(:user) }
  let(:user) { FactoryBot.create(:user) }

  before do
    post login_path, params: { user: { email: user.email, password: user.password_digest } }
  end

  describe 'POST #create' do
    it 'creates user data' do
      post '/users', params: { user: user_params }
      expect(response.status).to eq(200)
    end 

    it 'renders the user as JSON' do
      post '/users/', params: { user: user_params }
      expect(response.body).to eq(User.last.to_json)
    end
  end

  describe "GET /index" do
    it 'returns a successful response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'returns an unsuccessful response' do
      get logout_path
      get '/users'
      expect(response.body).to eq({ message: 'after login you can see all vehicles!!  thank you!' }.to_json)
    end
  end
end

  # describe "POST 'create'" do
  #   it "should create a session for the user" do
  #     user = FactoryBot.create(:user)
      
  #     post login_path, params: { user: { email: user.email, password: user.password_digest } }
      
  #     expect(response).to have_http_status(:success)
  #   end
  # end

