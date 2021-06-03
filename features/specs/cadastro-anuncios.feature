#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponiliza-los para locação


    Contexto: Login
        * Login com "gabigol@gmail.com" e "pwd123"


    Cenario: Novo equipo

        # A tabela abaixo foi criada como sendo: Chave e Valor
        # Foi escolhida este tipo de tabela porque so foi criado um unico registro
        Dado que acesso o formulario de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    @temp
    Cenario: Anúncio sem foto
        Dado que acesso o formulario de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     |               |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "Adicione uma foto no seu anúncio!"