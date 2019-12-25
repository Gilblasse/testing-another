class Passenger < ActiveRecord::Base
    has_many :ratings, as: :ratingable
end
