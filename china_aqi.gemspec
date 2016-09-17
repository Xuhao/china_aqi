lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'china_aqi/version'

Gem::Specification.new do |spec|
  spec.name          = 'china_aqi'
  spec.version       = ChinaAqi::VERSION
  spec.authors       = ['Xuhao']
  spec.email         = ['xuhao@rubyfans.com']
  spec.description   = 'China AQI API from PM25.in'
  spec.summary       = 'China AQI API from PM25.in'
  spec.homepage      = 'https://github.com/Xuhao/china_aqi'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  if RUBY_VERSION < '2.2.2'
    spec.add_dependency 'activesupport', '~> 4.0'
  else
    spec.add_dependency 'activesupport'
  end
  spec.add_dependency 'httparty'
end
