module ChinaAqi
  # Fetch ranking for all cities
  class Ranking < StaticBase
    self.method = :aqi_ranking
  end
end
