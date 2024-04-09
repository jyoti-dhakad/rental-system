require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'is valid with valid attributes' do
    vehicle = FactoryBot.create(:vehicle)
    expect(vehicle).to be_valid
  end

  it 'is not valid with invalid attributes' do
    vehicle = Vehicle.create(name:"abc")
    expect(vehicle).to_not be_valid
  end

  it 'is not valid with invalid attributes' do
    vehicle = Vehicle.create(name:"abc", rent_price:"1200.0")
    expect(vehicle).to_not be_valid
  end

  it 'is not valid with invalid attributes' do
    vehicle = Vehicle.create(name:"abc", rent_price:"120.0", model_number:"p123")
    expect(vehicle).not_to be_valid
  end

  it 'is not valid with invalid attributes' do
    vehicle = Vehicle.create(name:"abc", rent_price:"120.0", model_number:"p123", picture:"abc")
    expect(vehicle).not_to be_valid
  end
end
