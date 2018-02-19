class ForecastService

  def initialize(zip)
    @zip = zip
  end

  def forecast
    body[:forecast][:simpleforecast][:forecastday].map do |day|
      ForecastDayService.new(day)
    end
  end

  private

    def response
      Faraday.get("http://api.wunderground.com/api/#{ENV['weather_api_key']}/forecast10day/q/#{@zip}.json")
    end

    def body
      JSON.parse(response.body, symbolize_names: true)
    end

end
