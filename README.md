# ChinaAqi

[![Gem Version](https://badge.fury.io/rb/china_aqi.png)](http://badge.fury.io/rb/china_aqi)
[![Build Status](https://travis-ci.org/Xuhao/china_aqi.png?branch=master)](https://travis-ci.org/Xuhao/china_aqi)
[![Code Climate](https://codeclimate.com/github/Xuhao/china_aqi.png)](https://codeclimate.com/github/Xuhao/china_aqi)
[![Dependency Status](https://gemnasium.com/Xuhao/china_aqi.png)](https://gemnasium.com/Xuhao/china_aqi)
[![Coverage Status](https://coveralls.io/repos/Xuhao/china_aqi/badge.png?branch=master)](https://coveralls.io/r/Xuhao/china_aqi?branch=master)

China Air Quality Index API for Ruby. Thanks [pm25.in][pm25_in] for provide all the AQI sources for us as free, all the data is form China's official sector. it's a reall gread work! ChinaAqi gem provide some interface base on Ruby On Rails, before to use it, you need ask for a token form [pm25.in][pm25_in_api].

All monitoring stations in most cities of China are available, most AQI data are available, they are:

  - **CO**: 一氧化碳
  - **NO2**: 二氧化氮
  - **O3**: 臭氧
  - **PM10**: 颗粒物（粒径小于等于10μm）
  - **PM2.5**: 颗粒物（粒径小于等于2.5μm）
  - **SO2**: 二氧化硫

### Chinese PM2.5 reporting from U.S. Consulate

About PM2.5 reporting from U.S. Consulate please check out: [pm25
](https://github.com/ekohe/pm25)

## Compatibility
  CRuby 1.9.3 or greater, 2.2+ recommended. JRuby not sure.

  Support for Rails:
  * Rails 3 (not sure)
  * Rails 4 (tested)
  * Rails 5 (tested)

## Installation

Add this line to your application's Gemfile:

    gem 'china_aqi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install china_aqi

### For Rails app

Run install generator:

    $ rails generate china_aqi:install

It will add a new line in config/application.rb:

```ruby
config.china_aqi_token = 'you_token_here'
```
Put your token there.

### For non-Rails app

Just require `china_aqi` and then assign a valid token for it:

```ruby
require 'rubygems'
require 'china_aqi'

ChinaAqi.token = 'you_token_here'
```

## Usage

As we mention at the beginning, we must get a token form [pm25.in][pm25_in_api] before we use their APIs, it's free!

### Parameters

Most APIs accept three params:

- `city`: city name can be chinese characters, pinyin and area code('上海' or 'shanghai' or '021')
- `avg`: true/false, optional, if true, return average for all monitoring stations, default is true.
- `stations`: yes/no, optional, if yes, return data for all monitoring stations; if no, just return average without stations data, default is yes.

`avg` and `stations` params is optional, it will use defaut value if not set them.

### Examples

##### CO: 一氧化碳

```ruby
shanghai = ChinaAqi::CO.new('上海', avg: true, stations: :yes) # same as ChinaAqi::CO.new('上海')
# => #<ChinaAqi::CO:0x007fbf9d953238 @city="021", @parmas={:avg=>true ...
shanghai.get
# => [{"aqi"=>57, "area"=>"上海", "co"=>0.0, "co_24h"=>0.0, "position_name"=>"普陀", "primary_pollutant" ...
ChinaAqi::CO.get('上海', avg: true, stations: :yes) # => Same as above
```

##### NO2: 二氧化氮

```ruby
ChinaAqi::NO2.new('021').get  # or ChinaAqi::NO2.get('021')
# => [{"aqi"=>57, "area"=>"上海", "no2"=>0, "no2_24h"=>0, "position_name"=>"普陀", "primary_pollutant" ...

```

##### O3: 臭氧

```ruby
ChinaAqi::O3.new('shanghai').get  # or ChinaAqi::O3.get('shanghai')
# => [{"aqi"=>57, "area"=>"上海", "o3"=>0, "o3_24h"=>0, "o3_8h"=>0, "o3_8h_24h"=>0, "position_name" ...
```

##### PM10: 颗粒物（粒径小于等于10μm）

```ruby
ChinaAqi::PM10.new('上海').get  # or ChinaAqi::PM10.get('上海')
# => [{"aqi"=>57, "area"=>"上海", "pm10"=>55, "pm10_24h"=>64, "position_name"=>"普陀", "primary_pollutant" ...
```
##### PM2.5: 颗粒物（粒径小于等于2.5μm）

```ruby
ChinaAqi::PM25.new('shanghai').get  # or ChinaAqi::PM25.get('shanghai')
# => [{"aqi"=>57, "area"=>"上海", "pm2_5"=>21, "pm2_5_24h"=>38, "position_name"=>"普陀", "primary_pollutant" ...
```

##### SO2: 二氧化硫

```ruby
ChinaAqi::SO2.new('shanghai').get  # or ChinaAqi::SO2.get('shanghai')
# => [{"aqi"=>57, "area"=>"上海", "so2"=>0, "so2_24h"=>0, "position_name"=>"普陀", "primary_pollutant" ...
```

##### Simple data for all monitoring stations in one city

```ruby
ChinaAqi::City.new('shanghai').get  # or ChinaAqi::City.get('shanghai')
# => [{"aqi"=>57, "area"=>"上海", "so2"=>0, "so2_24h"=>0, "position_name"=>"普陀", "primary_pollutant" ...
```

##### Detail data for all monitoring stations in one city

```ruby
ChinaAqi::CityPro.new('shanghai').get  # or ChinaAqi::CityPro.get('shanghai')
# => [{"aqi"=>57, "area"=>"上海", "co"=>0.0, "co_24h"=>0.0, "no2"=>0, "no2_24h"=>0, ...
```

##### Detail data for one monitoring station

```ruby
ChinaAqi::Station.new('1141A').get  # or ChinaAqi::Station.get('1141A')
# => [{"aqi"=>57, "area"=>"上海", "co"=>0.0, "co_24h"=>0.0, "no2"=>0, "no2_24h"=>0, ...
```


##### Fetch all data

```ruby
ChinaAqi::Global.new.get
# same as below:
ChinaAqi::Global.get
# => [{"aqi"=>57, "area"=>"上海", "co"=>0.0, "co_24h"=>0.0, "no2"=>0, "no2_24h"=>0, ...
```

##### AQI Ranking for China

```ruby
ChinaAqi::Ranking.new.get
# same as below:
ChinaAqi::Ranking.get
# => [{"aqi"=>57, "area"=>"上海", "co"=>0.0, "co_24h"=>0.0, "no2"=>0, "no2_24h"=>0, ...
```

### Helpers

```ruby
# Get station names and station codes for one city
ChinaAqi.get_stations_for_city('上海')
ChinaAqi.get_stations_for_city('shanghai')
ChinaAqi.get_stations_for_city('021')
# same as:
ChinaAqi::CityStations.get('上海/shanghai/021')
# {"city"=>"上海", "stations"=>[{"station_name"=>"普陀" ..
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[pm25_in]: http://www.pm25.in
[pm25_in_api]: http://www.pm25.in/api_doc
