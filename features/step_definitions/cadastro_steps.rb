Dado('que acesso a página de cadastro') do
    visit "http://rocklov-web:3000/signup"
end

Quando('submeto o meu cadastro completo') do

    MongoDB.new.remove_user("jorgecandido@gmail.com")

    find("#fullName").set "Jorge Candido"
    find("#email").set "jorgecandido@gmail.com"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end

Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end

Quando('submeto o meu cadastro sem o nome') do
    find("#email").set Faker::Internet.free_email
    find("#password").set "pwd123"

    click_button "Cadastrar"
end
  
Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe seu nome completo!"
end

Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "Jorge Candido"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end

Quando('submeto o meu cadastro com email incorreto') do
    find("#fullName").set "Jorge Candido"
    find("#email").set "Jorge#gmail.com"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end  
  
Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe um email válido!"
    #sleep 5 # temporário, apenas para testes
end
  
Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set "Jorge Candido"
    find("#email").set Faker::Internet.free_email

    click_button "Cadastrar"
end
  
Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe sua senha secreta!"
end
  
Então('vejo a mensagem de alerta: {string}') do |string|
    expect(alert.text).to eql "Oops. Informe sua senha secreta!"
end
