Dado("Login com {string} e {string}") do |email, password|
  #variável global de email utilizada para passar por parâmetro no momento da deleção
  @email = email

  @login_page.open
  @login_page.with(email, password)
end

Dado("que acesso o formulario de cadastro de Anúncios") do
  @dash_page.goto_equipo_form
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash

  # log @anuncio
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

# Foi utilizado o 'have_text' do Capybara porque nesta mensagem de alerta tem um ícone, então precisamos verificar se contém um texto em uma string e não se são iguais(eql)
Então('deve conter a mensagem de alerta: {string}') do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end
