module ChinaAqi
  # Fetch data for one monitoring station
  #
  # example:
  #
  #   ChinaAqi::Station.new('1141A').get
  #
  # same as:
  #
  #   ChinaAqi::CityStations.get(station_code)
  #
  # You can get all station codes for one city like this:
  #
  #   ChinaAqi::CityStations.new(station_code).get
  #
  # or like this:
  #
  #   ChinaAqi.get_stations_for_city(city)
  #
  # and like this:
  #
  #   ChinaAqi::CityStations.get(city)
  class Station < Base
    self.method = :aqis_by_station
    attr_accessor :station_code

    def initialize(station_code)
      super
      @station_code = station_code
      @parmas = { station_code: station_code, token: ChinaAqi.token }
    end
  end
end