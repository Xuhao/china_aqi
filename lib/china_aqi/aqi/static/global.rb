module ChinaAqi
  # All data
  # This class is used for fetch data for all cities in china.
  # It will return a very big array, don't use it unless you have to！
  class Global < StaticBase
    self.method = :all_cities
  end
end
