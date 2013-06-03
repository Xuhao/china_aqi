module ChinaAqi
  # Fetch detail data for all monitoring stations in one city
  class CityPro < Base
    self.method = :aqi_details
  end
end