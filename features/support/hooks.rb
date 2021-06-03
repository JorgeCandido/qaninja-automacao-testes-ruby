# hooks -> criação do 'gancho' de inicialização, ou seja, irá executar este 'gancho' antes de cada cenário

# Instância de um page objects dentro de um método before que é um gancho do cucumber
Before do
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new
end
