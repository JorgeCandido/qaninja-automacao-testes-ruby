#language: pt

Funcionalidade: login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "candido@gmail.com" e "pwd123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input           | senha_input | mensagem_output                  |
            | candido@gmail.com     | teste123    | Usuário e/ou senha inválidos.    |
            | jorgeteste@500.com    | pwd123      | Usuário e/ou senha inválidos.    |
            | jorgeteller&gmail.com | teste456    | Oops. Informe um email válido!   |
            |                       | teste789    | Oops. Informe um email válido!   |
            | candido@gmail.com     |             | Oops. Informe sua senha secreta! |




