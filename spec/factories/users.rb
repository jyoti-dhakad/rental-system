FactoryBot.define do
  sequence(:email) { |n| "example1223#{n}@example.com" }
  

  factory :user do
    email { generate :email }
    
    password_digest { "123123" }
    first_name { "Bob" }
    last_name { "Bobson" }
    phone_number { "123456789" }
  end
end