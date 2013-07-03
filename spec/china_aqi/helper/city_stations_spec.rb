require 'spec_helper'

describe ChinaAqi do
  describe ChinaAqi::CityStations do
    include_examples "common dynamic examples", ChinaAqi::CityStations
    include_examples "class attribute", ChinaAqi::CityStations, :station_names

    before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

    it 'should have module function called get_stations_for_city to get stations for one city' do
      ChinaAqi.respond_to?(:get_stations_for_city).should be_true
      stations = ChinaAqi.get_stations_for_city('Shanghai')
      stations.should be_a(Hash)
      stations.key?('city').should be_true
      stations.key?('stations').should be_true
      stations['stations'].should be_a(Array)
      stations['city'].should eq('上海')
    end

    it 'should return a hash with aqi data when call "get" instance method' do
      stations = ChinaAqi::CityStations.new('Shanghai').get
      stations.should be_a(Hash)
      stations.key?('city').should be_true
      stations.key?('stations').should be_true
      stations['stations'].should be_a(Array)
      stations['city'].should eq('上海')
    end
  end
end