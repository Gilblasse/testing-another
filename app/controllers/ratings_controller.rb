class RatingsController < ApplicationController

  # GET: /ratings
  get "/ratings" do
    erb :"/ratings/index.html"
  end

  # GET: /ratings/new
  get "/ratings/new" do
    erb :"/ratings/new.html"
  end

  # POST: /ratings
  post "/ratings" do
    redirect "/ratings"
  end

  # GET: /ratings/5
  get "/ratings/:id" do
    erb :"/ratings/show.html"
  end

  # GET: /ratings/5/edit
  get "/ratings/:id/edit" do
    erb :"/ratings/edit.html"
  end

  # PATCH: /ratings/5
  patch "/ratings/:id" do
    redirect "/ratings/:id"
  end

  # DELETE: /ratings/5/delete
  delete "/ratings/:id/delete" do
    redirect "/ratings"
  end
end
