require 'rails_helper'

RSpec.describe "CurrentUsers", type: :request do
  describe "GET /index" do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      post login_path, params: { user: { email: user.email, password: user.password_digest } }
      get '/current_users'
      expect(response).to be_successful
    end
    it 'returns a unsuccessful response' do
      user = FactoryBot.create(:user)
      get logout_path
      get  '/current_users'
      expect(response.body).to eq({ message: 'after login you can see your profile!!' }.to_json)
    
    end
  end
end
