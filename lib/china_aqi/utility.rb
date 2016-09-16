require 'httparty'
require 'active_support/core_ext/class/attribute'
require 'active_support/json/decoding'
require 'active_support/core_ext/object/to_query'
require 'active_support/core_ext/object/blank'
require 'active_support/concern'
module ChinaAqi
  module Utility
    extend ::ActiveSupport::Concern

    included do
      include HTTParty
      attr_accessor :parmas
      class_attribute :base_uri, :method
      self.base_uri = URI::HTTP.build(host: 'www.pm25.in')
    end

    def get
      ::ActiveSupport::JSON.decode(HTTParty.get(url).body)
    end

    def uri
      raise NotImplementedError, "Please set value for 'method' class attributes in '#{self.class.name}' class." unless self.class.method
      self.class.base_uri.path = "/api/querys/#{self.class.method}.json"
      self.class.base_uri.query = @parmas.to_query
      self.class.base_uri
    end

    def url
      uri.to_s
    end
  end
end
