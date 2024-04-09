class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  enum rating: { 
    star_1: 1, 
    star_2: 2, 
    star_3: 3, 
    star_4: 4,
    star_5: 5
  }
  
end
