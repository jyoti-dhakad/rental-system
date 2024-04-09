FactoryBot.define do
  factory :booking do
    pick_up {'1/1/2024'}
    pick_up_time {'12:00 pm'}
    drop_off {'1/1/2024'}
    drop_off_time {'2:00 pm'}
    vehicle_id {4}
    user
  end
end
