class Driver < ActiveRecord::Base
    has_many :ratings, as: :ratingable
    has_many :trips
    has_many :passengers, :through => :trips
end
