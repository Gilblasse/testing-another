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

        calc = {"ft"=> num,"mi"=> num * 5280} #convert everthing to feet

        @drivers_distance = calc[measurement]
    end

end