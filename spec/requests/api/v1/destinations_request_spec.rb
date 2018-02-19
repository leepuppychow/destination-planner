require 'rails_helper'

describe "Destinations API" do
  context "HTTP GET" do
    it "sends a list of destinations in JSON format" do
      create_list(:destination, 3)

      get '/api/v1/destinations'
      expect(response).to be_success

      destinations = JSON.parse(response.body)
      expect(destinations.count).to eq 3
    end

    it "can get an individual destination by ID" do
      destination = create(:destination)
      get "/api/v1/destinations/#{destination.id}"

      expect(response).to be_success
      destination = JSON.parse(response.body)
      expect(destination.class).to eq Hash
      expect(destination["name"]).to eq "Denver"
    end


  end

end
