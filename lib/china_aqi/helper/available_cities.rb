module ChinaAqi
  class AvailableCities < StaticBase
    self.method = '/querys'
  end

  def available_cities
    AvailableCities.new.get
  end

  module_function :available_cities
end
