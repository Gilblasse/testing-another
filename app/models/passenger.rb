class Passenger < ActiveRecord::Base
    has_many :ratings, as: :ratingable
    has_many :trips
    has_many :drivers, :through => :trips

    def create_trip(address={})
        trip = Trip.create(address)
        self.trips << trip
        Trip.find(trip.id)
    end



end
