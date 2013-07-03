require 'spec_helper'

describe ChinaAqi::Station do
  before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

  ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
  obj = ChinaAqi::Station.new('1141A')

  include_examples "common examples", ChinaAqi::Station, obj
  include_examples "class attribute", ChinaAqi::Station, :aqis_by_station

  it 'should have station_code instance variable' do
    obj = ChinaAqi::Station.new('1141A')
    obj.instance_variable_defined?(:@station_code).should be_true
  end
end