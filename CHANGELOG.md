## v0.0.6 (Feb 17, 2017)

* Only support ruby 2.0+, use v0.0.5 for ruby 1.9

## v0.0.5 (Sep 17, 2016)

* New api for get available cities:
  ```ruby
  ChinaAqi.available_cities # or ChinaAqi::AvailableCities.new.get
  # {"cities"=>["七台河", "三亚", "三明", "三门峡" ...
  ```

* Compatibility improvements.
