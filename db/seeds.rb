
10.times do 
    passenger = Passenger.create(name: Faker::Name.unique.name)
    driver = Driver.create(name: Faker::Name.unique.name)

    trip = passenger.create_trip(
                origin_title: Faker::Company.unique.name,
                origin_address: Faker::Address.unique.full_address,
                destination_title: Faker::Company.unique.name,
                destination_address: Faker::Address.unique.full_address
            )
    driver.trips << trip

    passenger.rate_driver({comment: Faker::Lorem.unique.sentence,stars: rand(1..5) },trip)
    driver.rate_passenger({comment: Faker::Lorem.unique.sentence,stars: rand(1..5) },trip)
end
puts "Seeding Data Completed..."