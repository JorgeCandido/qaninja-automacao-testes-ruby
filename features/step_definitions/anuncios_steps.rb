Dado('que estou logado como {string} e {string}:') do |email, password|
    #variável global de email utilizada para passar por parâmetro no momento da deleção
    @email = email

    @login_page.open
    @login_page.with(email, password)
end
  
Dado('que acesso o formulario de cadastro de Anúncios') do
    click_button "Criar anúncio"

    # Isso é um checkpoint para garantir que estou no local correto
    expect(page).to have_css "#equipoForm" 
end

Dado('que eu tenho o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash
    # log @anuncio

    MongoDB.new.remove_equipo(@anuncio[:nome], @email)    
end
  
Quando('submeto o cadastro desse item') do

    # obtém o diretório de execução do projeto
   thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

    # O 'visible: false' foi colocado para buscar mesmo se o seletor estiver oculto  
    find("#thumbnail input[type=file]", visible: false).set thumb

    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("input[placeholder^='Valor']").set @anuncio[:preco]

    click_button "Cadastrar"

    # sleep 10
end
  
Então('devo ver esse item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia" 

    # sleep 5
end
  