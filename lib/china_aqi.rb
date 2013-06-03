require "china_aqi/version"
require 'active_support/core_ext/module/attribute_accessors'

module ChinaAqi
  mattr_accessor :token, instance_accessor: false
end

require 'china_aqi/exceptions'
require 'china_aqi/base'
require 'china_aqi/city_stations'