FactoryBot.define do
  factory :feedback do
    rating {'star_1'}
    comment { "MyText" }
    user 
    booking 
   
  end
end
