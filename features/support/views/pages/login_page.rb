# Padrão Page Objects incluindo o conceito de App Actions que é implementar as açoes da aplicação, as funcionalidades, as responsabilidades dentro de cada método usando o poder do encapsulamento

class LoginPage

    include Capybara::DSL # Atribuir e reconhecer todos os métodos do Capybara
    
    def open 
        visit "/"
    end

    def with(email, password)
        find("input[placeholder='Seu email']").set email
        find("input[type=password]").set password
        click_button "Entrar"
    end
end