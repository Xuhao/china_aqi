require 'coveralls'
require 'vcr'
Coveralls.wear!
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'china_aqi'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
