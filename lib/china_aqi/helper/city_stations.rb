require 'china_aqi/utility'
module ChinaAqi
  # All monitoring station names in one city
  class CityStations < DynamicBase
    self.method = :station_names
  end

  # create a helper in ChinaAqi module
  def get_stations_for_city(city)
    CityStations.new(city).get
  end

  module_function :get_stations_for_city
end
