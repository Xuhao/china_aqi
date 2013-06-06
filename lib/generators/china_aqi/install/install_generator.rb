class ChinaAqi::InstallGenerator < Rails::Generators::Base
  def append_token_config
    application "config.china_aqi_token = 'you_token_here'"
    puts ''
    puts '-' * 66
    puts "Find below line in config/application.rb:\n\n"
    puts "    config.china_aqi_token = 'you_token_here'\n\n"
    puts "Put your token."
    puts '-' * 66
    puts ''
  end
end
