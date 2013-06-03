module ChinaAqi
  # Fetch ranking for all cities
  class Ranking < Base
    self.method = :aqi_ranking

    def initialize
      raise TokenMissingError, 'Token is missing, please set token first!' if ChinaAqi.token.blank?
      @token = ChinaAqi.token
      @parmas = { token: ChinaAqi.token }
    end
  end
end