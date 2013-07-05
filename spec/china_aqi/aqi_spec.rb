require 'spec_helper'

describe ChinaAqi do
  before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

  describe 'Shared examples' do
    shared_examples "common examples" do |klass, obj|
      it 'should return URI::HTTP object own context when call "uri" method' do
        uri = obj.uri
        uri.should be_a(URI::HTTP)
        uri.host.should eq('www.pm25.in')
        uri.path.should eq("/api/querys/#{klass.method.to_s}.json")
      end

      it 'should return url string with own context when call "url" method' do
        obj.url.should be_a(String)
        obj.url.include?("http://www.pm25.in/api/querys/#{klass.method.to_s}.json").should be_true
      end

      it 'should return an array or hash with aqi data when call "get" method' do
        data = obj.get
        data.class.should satisfy{|k| [Array, Hash].include?(k)}
      end
    end

    shared_examples 'class attribute' do |klass, value|
      it "should have class attribute 'method' equal #{value}" do
        klass.method.should eq(value)
      end
    end

    shared_examples "common dynamic examples" do |klass|
      ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
      obj = klass.new('shanghai')

      include_examples "common examples", klass, obj
    end

    shared_examples "common static examples" do |klass|
      ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
      obj = klass.new

      include_examples "common examples", klass, obj
    end
  end

  describe 'Dynamic models' do
    describe ChinaAqi::City do
      include_examples "common dynamic examples", ChinaAqi::City
      include_examples "class attribute", ChinaAqi::City, :only_aqi
    end

    describe ChinaAqi::CityPro do
      include_examples "common dynamic examples", ChinaAqi::CityPro
      include_examples "class attribute", ChinaAqi::CityPro, :aqi_details
    end

    describe ChinaAqi::CO do
      include_examples "common dynamic examples", ChinaAqi::CO
      include_examples "class attribute", ChinaAqi::CO, :co
    end

    describe ChinaAqi::NO2 do
      include_examples "common dynamic examples", ChinaAqi::NO2
      include_examples "class attribute", ChinaAqi::NO2, :no2
    end

    describe ChinaAqi::O3 do
      include_examples "common dynamic examples", ChinaAqi::O3
      include_examples "class attribute", ChinaAqi::O3, :o3
    end

    describe ChinaAqi::PM10 do
      include_examples "common dynamic examples", ChinaAqi::PM10
      include_examples "class attribute", ChinaAqi::PM10, :pm10
    end

    describe ChinaAqi::PM25 do
      include_examples "common dynamic examples", ChinaAqi::PM25
      include_examples "class attribute", ChinaAqi::PM25, :pm2_5
    end

    describe ChinaAqi::SO2 do
      include_examples "common dynamic examples", ChinaAqi::SO2
      include_examples "class attribute", ChinaAqi::SO2, :so2
    end
  end

  describe 'Static models' do
    describe ChinaAqi::Global do
      include_examples "common static examples", ChinaAqi::Global
      include_examples "class attribute", ChinaAqi::Global, :all_cities
    end

    describe ChinaAqi::Ranking do
      include_examples "common static examples", ChinaAqi::Ranking
      include_examples "class attribute", ChinaAqi::Ranking, :aqi_ranking
    end
  end

  describe 'Station' do
    describe ChinaAqi::Station do
      ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
      obj = ChinaAqi::Station.new('1141A')

      include_examples "common examples", ChinaAqi::Station, obj
      include_examples "class attribute", ChinaAqi::Station, :aqis_by_station

      it 'should have station_code instance variable' do
        obj = ChinaAqi::Station.new('1141A')
        obj.instance_variable_defined?(:@station_code).should be_true
      end
    end
  end

  describe 'Helper' do
    describe ChinaAqi::CityStations do
      include_examples "common dynamic examples", ChinaAqi::CityStations
      include_examples "class attribute", ChinaAqi::CityStations, :station_names

      before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

      it 'should have module function called get_stations_for_city to get stations for one city' do
        ChinaAqi.respond_to?(:get_stations_for_city).should be_true
        stations = ChinaAqi.get_stations_for_city('shanghai')
        stations.should be_a(Hash)
        stations.key?('city').should be_true
        stations.key?('stations').should be_true
        stations['stations'].should be_a(Array)
        stations['city'].should eq('上海')
      end

      it 'should return a hash with aqi data when call "get" instance method' do
        stations = ChinaAqi::CityStations.new('shanghai').get
        stations.should be_a(Hash)
        stations.key?('city').should be_true
        stations.key?('stations').should be_true
        stations['stations'].should be_a(Array)
        stations['city'].should eq('上海')
      end
    end
  end

end