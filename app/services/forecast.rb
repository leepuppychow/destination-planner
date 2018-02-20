class Forecast

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def ten_days
    ForecastService.new(@zipcode).weather_data.map do |day|
      ForecastDay.new(day)
    end
  end

end
