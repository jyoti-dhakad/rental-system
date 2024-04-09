require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/vehicles'
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get '/vehicles/:id'
      expect(response).to be_successful
    end
  end


end
