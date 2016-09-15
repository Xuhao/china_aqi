require 'spec_helper'

describe ChinaAqi do
  before { described_class.token = nil }

  it 'have a version number' do
    expect(ChinaAqi::VERSION).not_to be_nil
  end

  it 'return token which defined in rails application configuration file.' do
    stub_const('Rails', Module.new)
    allow(Rails).to receive_message_chain('application.config.china_aqi_token') { 'chian_aqi_token_test_sample' }
    expect(described_class.token).to eq('chian_aqi_token_test_sample')
  end
end
