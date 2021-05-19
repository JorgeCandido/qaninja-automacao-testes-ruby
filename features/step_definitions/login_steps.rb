Dado('que acesso a página principal') do
    visit "/"
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    find("input[placeholder='Seu e-email']").set email
    find("input[type=password]").set password

    click_button "Entrar"
end
  