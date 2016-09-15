class ChinaAqi::InstallGenerator < Rails::Generators::Base
  def append_token_config
    application "config.china_aqi_token = 'you_token_here'\n"
    application '# API key for PM25.in'
    puts "Find below line in \e[33mconfig/application.rb\e[0m:"
    puts "\e[32m  config.china_aqi_token = '\e[0m\e[31myou_token_here\e[0m\e[32m'\e[0m"
    puts 'Put your token.'
  end
end
