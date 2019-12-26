class Passenger < ActiveRecord::Base
    has_many :ratings, as: :ratingable
    has_many :trips
    has_many :drivers, :through => :trips
end
