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
    Esquema do Cenario: Tentativa de cadastro de anúncios

        Dado que acesso o formulario de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto           | nome              | categoria | preco | saida                                |
            |                | violao de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg  |                   | Outros    | 250   | Informe a descrição do anúncio!      |
            | telecaster.jpg | guitarra          |           | 300   | Informe a categoria                  |
            | trompete.jpg   | Trompete clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg      | Conga             | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg      | Conga             | Outros    | 100a  | O valor da diária deve ser numérico! |