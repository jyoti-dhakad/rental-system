require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(first_name:"dfgh")
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(first_name:"dfgh", last_name:"asd")
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(first_name:"dfgh", last_name:"asd", phone_number:"123456789")
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(first_name:"dfgh", last_name:"asd", phone_number:"123456789", email:"as@gmail.com")
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(email:"dfghgmail.com")
    expect(user).to_not be_valid
  end

end
