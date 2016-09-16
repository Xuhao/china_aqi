# coding: utf-8
require 'spec_helper'

describe ChinaAqi do
  before { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

  describe 'Shared examples' do
    RSpec.shared_examples 'common examples' do |klass, obj|
      it 'return URI::HTTP object own context when call `uri` method' do
        uri = obj.uri
        expect(uri).to be_a(URI::HTTP)
        expect(uri.host).to eq('www.pm25.in')
        expect(uri.path).to eq("/api/querys/#{klass.method}.json")
      end

      it 'return url string with own context when call `url` method' do
        expect(obj.url).to be_a(String)
        expect(obj.url).to include("http://www.pm25.in/api/querys/#{klass.method}.json")
      end

      it 'return an array or hash with aqi data when call `get` method' do
        data = obj.get
        expect(data.class).to satisfy { |k| [Array, Hash].include?(k) }
      end
    end

    RSpec.shared_examples 'class attribute' do |klass, value|
      it 'have class attribute `method` equal #{value}' do
        expect(klass.method).to eq(value)
      end
    end

    RSpec.shared_examples 'common dynamic examples' do |klass|
      ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
      obj = klass.new('shanghai')
      include_examples 'common examples', klass, obj
    end

    RSpec.shared_examples 'common static examples' do |klass|
      obj = klass.new
      include_examples 'common examples', klass, obj
    end
  end

  describe 'Dynamic models' do
    include_examples 'common dynamic examples', ChinaAqi::City
    include_examples 'class attribute', ChinaAqi::City, :only_aqi

    include_examples 'common dynamic examples', ChinaAqi::CityPro
    include_examples 'class attribute', ChinaAqi::CityPro, :aqi_details

    include_examples 'common dynamic examples', ChinaAqi::CO
    include_examples 'class attribute', ChinaAqi::CO, :co

    include_examples 'common dynamic examples', ChinaAqi::NO2
    include_examples 'class attribute', ChinaAqi::NO2, :no2

    include_examples 'common dynamic examples', ChinaAqi::O3
    include_examples 'class attribute', ChinaAqi::O3, :o3

    include_examples 'common dynamic examples', ChinaAqi::PM10
    include_examples 'class attribute', ChinaAqi::PM10, :pm10

    include_examples 'common dynamic examples', ChinaAqi::PM25
    include_examples 'class attribute', ChinaAqi::PM25, :pm2_5

    include_examples 'common dynamic examples', ChinaAqi::SO2
    include_examples 'class attribute', ChinaAqi::SO2, :so2
  end

  describe 'Static models' do
    include_examples 'common static examples', ChinaAqi::Global
    include_examples 'class attribute', ChinaAqi::Global, :all_cities

    include_examples 'common static examples', ChinaAqi::Ranking
    include_examples 'class attribute', ChinaAqi::Ranking, :aqi_ranking
  end

  describe ChinaAqi::Station do
    obj = ChinaAqi::Station.new('1141A')

    include_examples 'common examples', ChinaAqi::Station, obj
    include_examples 'class attribute', ChinaAqi::Station, :aqis_by_station

    it 'have station_code instance variable' do
      obj = ChinaAqi::Station.new('1141A')
      expect(obj).to have_attributes(station_code: '1141A')
    end
  end

  describe ChinaAqi::CityStations do
    include_examples 'common dynamic examples', ChinaAqi::CityStations
    include_examples 'class attribute', ChinaAqi::CityStations, :station_names

    it 'have module function called get_stations_for_city to get stations for one city' do
      stations = ChinaAqi.get_stations_for_city('shanghai')
      expect(stations).to have_key('city')
      expect(stations).to have_key('stations')
      expect(stations['stations']).to be_a(Array)
      expect(stations['city']).to eq('上海')
    end

    it 'return a hash with aqi data when call `get` instance method' do
      stations = ChinaAqi::CityStations.new('shanghai').get
      expect(stations).to have_key('city')
      expect(stations).to have_key('stations')
      expect(stations['stations']).to be_a(Array)
      expect(stations['city']).to eq('上海')
    end
  end
end
