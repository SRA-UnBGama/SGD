#language: en

Feature: User login
	To login
	As a system external_user
	I would like to login


Scenario: Login with external_user
	Given I am on the index page
	When I click on 'Usuario' link
	Then the login page is loaded
	Then I fill 'Matrícula FUB:' field
	Then I fill 'Senha:' field
	Then I click on 'Logar' button
 	Then the index page is loaded

Scenario: Create a new external_user
  	Given I am on the index page
  	When I click on 'Usuario' link
  	Then the login page is loaded
  	When I click on 'Cadastrar Novo Usuário' link
  	Then the sign_up page is loaded
  	Then I fill 'Nome:' field
  	Then I fill 'Matrícula FUB:' field
	Then I fill 'Matrícula SIAPE:' field
  	Then I fill 'Ocupação:' field
	Then I fill 'Lotação:' field
  	Then I fill 'E-mail:' field
  	Then I fill 'SenhaC:' field
  	Then I fill 'Confirmação de Senha:' field











