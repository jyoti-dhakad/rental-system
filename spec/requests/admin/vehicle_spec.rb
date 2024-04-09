require 'rails_helper'

RSpec.feature "Admin::Vehicles", type: :request do
  before do
    @admin_user = AdminUser.create(email: 'admin@example.com', password: 'password')
    @vehicle = FactoryBot.create(:vehicle)
  end

  def authenticate_admin_user
    post admin_user_session_path, params: { admin_user: { email: @admin_user.email, password: 'password' } }
    follow_redirect!  
  end

  describe 'GET #index' do
    context 'when vehicles fetch successfully' do
      before do
        authenticate_admin_user
        get '/admin/vehicles'
      end

      it 'responds with status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #show' do
    it 'responds with status 200' do
      authenticate_admin_user
      get admin_vehicle_path(@vehicle)
      expect(response).to have_http_status(200)
    end
  end

   

   
    describe 'POST #create' do
      it 'vehicle details' do
        authenticate_admin_user
        params = {
          vehicle: {
            name: 'abc',
            model_number: '12sd345',
            insurance: 'true',
            rent_price: "12.0"
          }
        }
        post admin_vehicles_path, params: params
    
        expect(response).to redirect_to(admin_vehicle_path(Vehicle.last))
        follow_redirect!
        
        expect(response).to have_http_status(200)
        expect(flash[:notice]).to eq('Vehicle was successfully created.')
      end
    end

    describe "GET #new" do
      before do
        authenticate_admin_user
        get '/admin/vehicles/new'
      end
      it "renders a new vehicle form with correct fields" do
        
        expect(response).to be_successful
        expect(response.body).to include("Vehicle Details")
  
        expect(response.body).to include("name")
        expect(response.body).to include("picture") 
        expect(response.body).to include("model_number")
        expect(response.body).to include("rent_price")
        expect(response.body).to include("insurance")
  
        expect(response.body).to include("submit")  
      end
  end
end