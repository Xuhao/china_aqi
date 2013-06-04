module ChinaAqi
  # Fetch data for one monitoring station
  #
  # example:
  #
  #   ChinaAqi::Station.new('1141A').get
  #
  # You can get all station codes for one city like this:
  #
  #   ChinaAqi::CityStations.new(city_name).get
  #
  # or like this:
  #
  #   ChinaAqi.get_stations_for_city(city)
  class Station < Base
    self.method = :aqis_by_station
    attr_accessor :station_code

    def initialize(station_code)
      super
      @station_code = station_code
      @token = ChinaAqi.token
      @parmas = { station_code: station_code, token: ChinaAqi.token }
    end
  end
end