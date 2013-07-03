require 'spec_helper'

describe ChinaAqi do
  before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

  ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'

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