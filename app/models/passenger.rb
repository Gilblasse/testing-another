class Passenger < ActiveRecord::Base
    has_many :ratings, as: :ratingable
    has_many :trips
    has_many :drivers, :through => :trips

    def create_trip(address={})
        return message(address[:origin_title]) if self.trips.any? {|trip| trip.origin_title == address[:origin_title] }
        return message(address[:destination_title]) if self.trips.any? {|trip| trip.destination_title == address[:destination_title] }
        
        trip = Trip.create(address)
        self.trips << trip
        trip
    end

    def rate_driver(rating={},trip)
        if trip.ratings.none? {|rating|  rating.ratingable == self }
            rating = self.ratings.create(comment: rating[:comment],stars: rating[:stars])

            trip.ratings << rating
            rating
        else  
            "Sorry #{self.name} but your only Allowed 1 rating Per Trip"
        end
    end

    def score 
       return 5 if drivers_ratings.empty?
        stars = drivers_ratings.map{|rating| rating.stars }
        stars.reduce{ |sum, num| sum + num }.to_i / stars.size
    end

    def drivers_ratings
        ratings = self.trips.map{|trip| trip.ratings }.flatten.select{|r| r.ratingable.class == Driver }
        ratings
    end

    def message(title)
        "The Title: #{title}, is already in use... Please choose another"
    end

end
