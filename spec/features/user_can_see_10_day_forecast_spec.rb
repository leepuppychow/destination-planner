require 'rails_helper'

describe "As a user when I visit the root path" do
  context "and I click on a specific destination" do
    it "I am taken to a show page with destination and forecast information" do
      denver = create(:destination)
      visit "/"
      click_on "Show"

      expect(current_path).to eq destination_path(denver)
      expect(page).to have_content "Denver"
      expect(page).to have_content "80241"
      expect(page).to have_content denver.description

      expect(page).to have_css(".day", count: 10)

      within(first(".day")) do
        expect(page).to have_css(".date")
        expect(page).to have_css(".high_temp")
        expect(page).to have_css(".low_temp")
        expect(page).to have_css(".conditions")
      end

    end
  end
end
# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and 10 day weather forecast
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
