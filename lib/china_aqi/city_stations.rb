require 'china_aqi/utility'
module ChinaAqi
  # All monitoring station names in one city
  class CityStations
    include ChinaAqi::Utility
    
    self.method = :station_names

    def initialize(city)
      raise TokenMissingError, 'Token is missing, please set token first!' if ChinaAqi.token.blank?
      @city = city
      @token = ChinaAqi.token
      @parmas = { city: city, token: ChinaAqi.token }
    end
  end

  # create a helper in ChinaAqi module
  def get_stations_for_city(city)
    CityStations.new(city).get
  end
  
  module_function :get_stations_for_city
end