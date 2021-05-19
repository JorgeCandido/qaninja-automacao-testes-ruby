Dado('que acesso a página de cadastro') do
    visit "/signup"
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
    # table is a cucumber::MultilineArgument::DataTable

    # log table.hashes 
   
    user = table.hashes.first # transforma a tabela que vem do cadastro em um array

    # log user # Exibe a criação do objeto Ruby na execução

    MongoDB.new.remove_user(user[:email])

    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Cadastrar"
end
  

