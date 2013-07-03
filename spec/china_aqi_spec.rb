require 'spec_helper'

describe ChinaAqi do
  before(:each) { ChinaAqi.token = nil }

  it 'should have a version number' do
    ChinaAqi::VERSION.should_not be_nil
  end

  it 'should return token which defined in rails application configuration file.' do
    stub_const('Rails', Module.new)
    Rails.stub_chain('application.config.china_aqi_token') { 'chian_aqi_token_test_sample' }
    ChinaAqi.token.should eq('chian_aqi_token_test_sample')
  end
end
