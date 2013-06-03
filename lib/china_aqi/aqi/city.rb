module ChinaAqi
  # Fetch simple data for all monitoring stations in one city
  class City < Base
    self.method = :only_aqi
  end
end