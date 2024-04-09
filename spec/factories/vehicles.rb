FactoryBot.define do
  factory :vehicle do
    sequence(:model_number) { |n| "M#{n}" }
    name {"abc"}
    
    rent_price {"1200.0"}
    # model_number {"1jq234"}
    insurance {true}
  end
end
