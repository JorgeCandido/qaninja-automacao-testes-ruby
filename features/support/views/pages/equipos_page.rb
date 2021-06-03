class EquiposPage
  include Capybara::DSL

  def create(equipo)
    # checkpoint com timeout explícito
    page.has_css?("#equipoForm")

    # chamada do método upload e testa se o valor 'thumb' esta preenchido
    upload(equipo[:thumb]) if equipo[:thumb].length > 0

    find("input[placeholder$=equipamento]").set equipo[:nome]
    find("#category").find("option", text: equipo[:categoria]).select_option
    find("input[placeholder^='Valor']").set equipo[:preco]

    click_button "Cadastrar"
  end

  def upload(file_name)
    # obtém o diretório de execução do projeto
    thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

    # O 'visible: false' foi colocado para buscar mesmo se o seletor estiver oculto
    find("#thumbnail input[type=file]", visible: false).set thumb
  end
end
