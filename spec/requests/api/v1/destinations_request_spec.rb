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

  context "POST requests" do
    #note that params in url would appear like:
    #/destinations?destination[name]=blerg&destination[zip]=47621

    it "can create a new destination" do
      destination_params = {name: "Taipei",
                            zip: "Idunno",
                            description: "family",
                            image_url: "blank"}

      post "/api/v1/destinations", params: {destination: destination_params}
      destination = Destination.last
      expect(response).to be_success
      expect(destination.name).to eq "Taipei"
    end
  end

  context "PUT/PATCH requests" do
    it "can update an existing destination" do
      #note that params in url would appear like:
      #/destinations?destination[name]=blerg&destination[zip]=47621

      place1 = create(:destination)
      destination_params = {name: "Taipei",
                            zip: "Idunno"}

      expect(place1.name).to eq "Denver"
      patch "/api/v1/destinations/#{place1.id}", params: {destination: destination_params}
      expect(response).to be_success
      updated = Destination.find(place1.id)
      expect(updated.name).to eq "Taipei"
    end
  end

  context "DELETE requests" do
    it "can delete an existing destination" do
      place1,place2 = create_list(:destination, 2)

      expect(Destination.count).to eq 2

      delete "/api/v1/destinations/#{place1.id}"
      expect(response).to be_success
      expect(Destination.count).to eq 1
    end
  end

end
