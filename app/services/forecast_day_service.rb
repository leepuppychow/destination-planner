class ForecastDayService

  def initialize(day_attributes)
    @day_attributes = day_attributes
  end

  def date
    @day_attributes[:date][:weekday] + ": " + @day_attributes[:date][:pretty]
  end

  def high_temp
    @day_attributes[:high]
  end

  def low_temp
    @day_attributes[:low]
  end

  def conditions
    @day_attributes[:conditions]
  end

end
