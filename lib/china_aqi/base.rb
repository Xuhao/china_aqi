require 'china_aqi/utility'
module ChinaAqi
  # Fetch data with different method
  #
  # Pass city name and params those API accept.
  #
  #  shanghai = ChinaAqi::PM25.new('city_name', params = { avg: true/false, stations: :yes/:no })
  #  shanghai.get
  #
  # this is same as:
  #
  #  ChinaAqi::PM25.get('city_name', params = { avg: true/false, stations: :yes/:no })
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
  #     ChinaAqi::PM25.get('shanghai')  # Same as above
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
    attr_accessor :token

    def initialize(*_)
      raise TokenMissingError, %Q(
        #{'*' * 66}
        Token is missing!

        Set token as below:

          ChinaAqi.token = "you_token"

        If you use it under Rails, set token as normal rails configuration:

          # config/application.rb
          config.china_aqi_token = "you_token"

        #{'*' * 66}) unless ChinaAqi.token
      @token = ChinaAqi.token
    end

    def self.get(*args)
      new(*args).get
    end
  end

  # APIs with some parameters
  class DynamicBase < Base
    attr_accessor :city

    def initialize(city, querys={ avg: true, stations: :yes })
      super
      @city = city
      @parmas = querys.merge(city: city, token: ChinaAqi.token)
    end
  end

  # APIs without any parameters
  class StaticBase < Base
    def initialize
      super
      @parmas = { token: ChinaAqi.token }
    end
  end
end

require 'china_aqi/aqi/dynamic/city'
require 'china_aqi/aqi/dynamic/city_pro'
require 'china_aqi/aqi/dynamic/co'
require 'china_aqi/aqi/dynamic/no2'
require 'china_aqi/aqi/dynamic/o3'
require 'china_aqi/aqi/dynamic/pm10'
require 'china_aqi/aqi/dynamic/pm25'
require 'china_aqi/aqi/dynamic/so2'

require 'china_aqi/aqi/static/global'
require 'china_aqi/aqi/static/ranking'

require 'china_aqi/aqi/station'
