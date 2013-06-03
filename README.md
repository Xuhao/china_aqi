# ChinaAqi

China Air Quality Index API for Rails.

Thanks [pm25.in][pm25_in] for provide all the AQI sources for us as free, all the data is form China's official sector. it's a reall gread work!

ChinaAqi gem provide some interface base on Ruby On Rails, before to use it, you need ask for a token form [pm25.in][pm25_in_api].

## Installation

Add this line to your application's Gemfile:

    gem 'china_aqi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install china_aqi

Run install generator:

    $ rails generate china_aqi:install

It will create file: config/initializers/china_aqi.rb

## Usage

As we mention at the beginning, we must get a token form [pm25.in][pm25_in_api] before we use their APIs, it's free!

Once you get the token, put it in config/initializers/china_aqi.rb, then enjoy!

Most AQI data are available, they are:

  - **co**: 一氧化碳
  - **no2**: 二氧化氮
  - **o3**: 臭氧
  - **pm10**: 颗粒物（粒径小于等于10μm）
  - **pm2.5**: 颗粒物（粒径小于等于2.5μm）
  - **so2**: 二氧化硫

All monitoring stations in most cities of China are available.

### Examples

    # City name can be Chinese characters, pinyin and area code
    # params:
    #  avg: if true,return average for all monitoring stations, default is true
    #  stations: if yes, return data for all monitoring stations; if no, just return average.

    shanghai = ChinaAqi::PM25.new('上海')  # #<ChinaAqi::PM25:0x007fe2a631aef8 @city="上海" ...
    shanghai.get                          # [{"aqi"=>74, "area"=>"上海", "pm2_5"=>48 ...
    ChinaAqi::PM25.new('021', avg: true, stations: :yes).get # Same as above.


    # Get so2 data for Shanghai
    ChinaAqi::SO2.new('shanghai', avg: true, stations: :no).get # [{"aqi"=>74, "area"=> ...

    # Get all data for one stations with code "1141A"
    ChinaAqi::Station.new('1141A').get  # [{"aqi"=>75, "area"=>"上海", "co"=>0.0, ...

    # Get all data that the API provide, never use it unless you have to.
    ChinaAqi::Global.new.get # [{"aqi"=>144, "area"=>"天津"

### Helpers

    # get station names and station codes for one city
    ChinaAqi.get_stations_for_city('上海')  # {"city"=>"上海", "stations"=>[{"station_name"=>"普陀"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[pm25_in]: http://www.pm25.in
[pm25_in_api]: http://www.pm25.in/api_doc