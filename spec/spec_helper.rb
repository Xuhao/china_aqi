require 'coveralls'
Coveralls.wear!
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir["./spec/support/**/*.rb"].each {|f| require f}
require 'china_aqi'
