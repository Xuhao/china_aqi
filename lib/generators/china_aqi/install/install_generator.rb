class ChinaAqi::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_china_aqi_file
    copy_file "china_aqi.rb", "config/initializers/china_aqi.rb"
  end
end
