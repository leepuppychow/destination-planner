class ForecastService

  def initialize(zip)
    @zip = zip
  end

  def weather_data
    get_json[:forecast][:simpleforecast][:forecastday]
  end

  private

    def response
      Faraday.get("http://api.wunderground.com/api/#{ENV['weather_api_key']}/forecast10day/q/#{@zip}.json")
    end

    def get_json
      JSON.parse(response.body, symbolize_names: true)
    end

end
