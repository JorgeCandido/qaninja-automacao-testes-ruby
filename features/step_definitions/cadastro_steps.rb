Dado('que acesso a página de cadastro') do
    @signup_page.open
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
    # table is a cucumber::MultilineArgument::DataTable

    # log table.hashes   
    user = table.hashes.first # transforma a tabela que vem do cadastro em um array
    
    # log user # Exibe a criação do objeto Ruby na execução
    MongoDB.new.remove_user(user[:email])

    @signup_page.create(user) 
end
  

