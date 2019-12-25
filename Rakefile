ENV["SINATRA_ENV"] ||= "test"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task 'console' do 
    Pry.start
end

namespace 'db' do

    desc "Removes data from tables and resets PK"
    task 'reset!' do 
        tables = ["passengers","drivers","ratings"]
        models = ["Passenger","Driver","Rating"]

        klasses = models.map {|model| model.constantize }
        klasses.each{|klass| klass.destroy_all }

        tables.each do |table|
            ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{table}'")
        end

        puts "Database is clean..."
    end
    
end