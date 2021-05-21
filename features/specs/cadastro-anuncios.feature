#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponiliza-los para locação

    Cenario: Novo equipo

        # A tabela abaixo foi criada como sendo: Chave e Valor
        # Foi escolhida este tipo de tabela porque so foi criado um unico registro
        Dado que estou logado como "gabigol@gmail.com" e "pwd123":
            E que acesso o formulario de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard