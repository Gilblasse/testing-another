class Driver < ActiveRecord::Base
    has_many :ratings, as: :ratingable
    has_many :trips
    has_many :passengers, :through => :trips

    attr_accessor :drivers_distance

    def self.closest_drivers(passenger_location)
        five_miles = 26411 #apporximate number of ft in 5 miles
        closest_drivers = self.all.select {|driver| driver.distance_from(passenger_location) < five_miles  &&  driver.available? == true}
        closest_drivers.sort_by { |driver| driver.drivers_distance}
    end

    def distance_from(passenger_location)
        distance = $gmaps.directions(self.current_location,passenger_location,mode: 'driving',alternatives: false)[0][:legs][0][:distance][:text]
        num = distance.gsub(/[A-Za-z\s]/,"").to_f
        measurement = distance.scan(/([A-Za-z])/).join

        calc = {"ft"=> num,"mi"=> num * 5280} #converts everthing to feet

        @drivers_distance = calc[measurement]
    end

    def rate_passenger(rating={},trip)
        if trip.ratings.none? {|rating|  rating.ratingable == self }
            rating = self.ratings.create(comment: rating[:comment],stars: rating[:stars])

            trip.ratings << rating
            rating
        else  
            "Sorry #{self.name} but your only Allowed 1 rating Per Trip"
        end
    end

    def score
        return 5 if passengers_ratings.empty? 
        stars = passengers_ratings.map{|rating| rating.stars }
        stars.reduce{ |sum, num| sum + num }.to_i / stars.size
    end

    def passengers_ratings
        ratings = self.trips.map{|trip| trip.ratings }.flatten.select{|r| r.ratingable.class == Passenger }
        ratings
    end

end