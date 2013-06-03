require 'china_aqi/utility'
module ChinaAqi
  # Fetch data with different method
  # 
  # Pass city name and params those API accept.
  #
  #  shanghai = ChinaAqi::PM25.new('city_name', params = { avg: true/false, stations: :yes/:no })
  #
  #  params:
  #    avg: if true,return average for all monitoring stations, default is true
  #    stations: if yes, return data for all monitoring stations; if no, just return average.
  #
  #  checkout explanation in http://www.pm25.in/api_doc
  #
  # examples
  #
  #     shanghai = ChinaAqi::PM25.new('上海')  # #<ChinaAqi::PM25:0x007fe2a631aef8 @city="上海"...
  #     shanghai.get                           # [{"aqi"=>74, "area"=>"上海", "pm2_5"=>48,...
  #
  #     # Get so2 data for 上海
  #     ChinaAqi::SO2.new('上海', avg: false, stations: :no).get  # [{"aqi"=>74, "area"=>"上海", "pm2_5"=>48,...
  #
  #     # Get all data for one stations with code "1141A"
  #     ChinaAqi::Station.new('1141A').get  # [{"aqi"=>75, "area"=>"上海", "co"=>0.0, "co_24h"=>0.0
  #
  #     # Get all data that the API provide
  #     ChinaAqi::Global.new.get
  #
  class Base
    include ChinaAqi::Utility

    attr_accessor :city

    def initialize(city, querys = {avg: true, stations: :yes})
      raise TokenMissingError, 'Token is missing, please set token first!' if ChinaAqi.token.blank?
      @city = city
      @parmas = querys.merge(city: city, token: ChinaAqi.token)
      @token = ChinaAqi.token
    end
  end
end

require 'china_aqi/aqi/city'
require 'china_aqi/aqi/city_pro'
require 'china_aqi/aqi/co'
require 'china_aqi/aqi/global'
require 'china_aqi/aqi/no2'
require 'china_aqi/aqi/o3'
require 'china_aqi/aqi/pm10'
require 'china_aqi/aqi/pm25'
require 'china_aqi/aqi/ranking'
require 'china_aqi/aqi/so2'
require 'china_aqi/aqi/station'