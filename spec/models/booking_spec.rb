require 'rails_helper'

RSpec.describe Booking, type: :model do
  it 'is valid with valid attributes' do
    booking = FactoryBot.create(:booking)
    expect(booking).to be_valid
  end

  it 'is valid with valid attributes' do
    booking = Booking.create(pick_up:"2/2/2024")
    expect(booking).to_not be_valid
  end

  it 'is valid with valid attributes' do
    booking = Booking.create(pick_up:"2/2/2024", drop_off:"3/3/2024")
    expect(booking).to_not be_valid
  end

  it 'is valid with valid attributes' do
    booking = Booking.create(pick_up:"2/2/2024", drop_off:"3/3/2024", pick_up_time:"12:00pm")
    expect(booking).to_not be_valid
  end
end
