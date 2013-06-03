require "china_aqi/version"

module ChinaAqi
  mattr_accessor :token, instance_accessor: false
end

require 'china_aqi/exceptions'
require 'china_aqi/base'
require 'china_aqi/city_stations'