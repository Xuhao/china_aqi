module ChinaAqi
  # All data
  # This class is used for fetch data for all cities in china.
  # It will return a very big array, don't use it unless you have to！
  class Global < Base
    self.method = :all_cities

    def initialize
      raise TokenMissingError, 'Token is missing, please set token first!' if ChinaAqi.token.blank?
      @token = ChinaAqi.token
      @parmas = { token: ChinaAqi.token }
    end
  end
end