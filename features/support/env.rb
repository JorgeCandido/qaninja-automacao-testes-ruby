require "capybara"
require "capybara/cucumber"
require "faker"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    
    # propriedade criada para definir a url padrão do sistema testado
    config.app_host =  "http://rocklov-web:3000"  

    # timeout implicito -> configuração para aumentar o timeout do capybara para evitar problemas de lentidão dos testes automatizados por conta de alterações no sistema
    config.default_max_wait_time = 10 
end