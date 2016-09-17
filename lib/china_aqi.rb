require 'china_aqi/version'
module ChinaAqi
  def self.token
    @token ||= begin
      if Module.const_defined?('Rails')
        Rails.application.config.china_aqi_token if Rails.application.config.respond_to?(:china_aqi_token)
      end
    end
  end

  def self.token=(token_string)
    @token = token_string
  end
end

require 'china_aqi/base'
require 'china_aqi/exceptions'
require 'china_aqi/helper/city_stations'
require 'china_aqi/helper/available_cities'
