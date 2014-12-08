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
