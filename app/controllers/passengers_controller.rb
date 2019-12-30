class PassengersController < ApplicationController

  # GET: /passengers
  get "/passengers" do
    # binding.pry
    @passengers = Passenger.all
    
    map = GoogleStaticMap.new
    map.api_key = $google_map_api_key
    map.markers << MapMarker.new(:color => "#ff3008", :location => MapLocation.new(:address => "1600 Pennsylvania Ave., Washington, DC"))
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => "1 1st Street Northeast, Washington, DC"))
    @image = map.url('http')
    
    erb :"/passengers/index.html"
  end

  # GET: /passengers/new
  get "/passengers/new" do
    erb :"/passengers/new.html"
  end

  # POST: /passengers
  post "/passengers" do
    redirect "/passengers"
  end

  # GET: /passengers/5
  get "/passengers/:id" do
    erb :"/passengers/show.html"
  end

  # GET: /passengers/5/edit
  get "/passengers/:id/edit" do
    erb :"/passengers/edit.html"
  end

  # PATCH: /passengers/5
  patch "/passengers/:id" do
    redirect "/passengers/:id"
  end

  # DELETE: /passengers/5/delete
  delete "/passengers/:id/delete" do
    redirect "/passengers"
  end
end
