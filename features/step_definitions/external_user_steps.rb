#Scenario Login with external_user
Given( /^I am on the index page$/ )do
	visit 'http://localhost:3000/'
end
When (/^I click on 'Usuario' link$/) do
	click_link('Usuários')
end

Then (/^the login page is loaded$/) do
	visit 'http://localhost:3000/users/sign_in'
end

Then (/^I fill 'Matrícula FUB:' field$/) do
	fill_in 'Matrícula FUB:', :with => '123'
end

Then (/^I fill 'Senha:' field$/) do
	fill_in "Senha", with: "123456"
end

Then (/^I click on 'Logar' button$/) do
	click_button ("Logar")
end

Then (/^the index page is loaded$/) do
	visit 'http://localhost:3000/'
end

#Scenario Login with external_user

When (/^I click on 'Cadastrar Novo Usuário' link$/) do
	click_link('Cadastrar Novo Usuário')
end

Then (/^the sign_up page is loaded$/) do
	visit 'http://localhost:3000/users/sign_up'
end

Then (/^I fill 'Nome:' field$/) do
	fill_in 'Nome:', :with => 'Teste'
end

Then (/^I fill 'Matrícula FUB:'$/) do
	fill_in 'Matrícula FUB:', :with => '12356632'
end

Then(/^I fill 'Matrícula SIAPE:' field$/) do
	fill_in 'Matrícula SIAPE:', :with => '1235763732'
end

Then(/^I fill 'Ocupação:' field$/) do
	fill_in 'Ocupação:', :with => 'Gestor'
end

Then(/^I fill 'Lotação:' field$/) do
	fill_in 'Lotação:', :with => 'FGA'
end

Then(/^I fill 'E-mail:' field$/) do
	fill_in 'E-mail:', :with => 'teste@teste.com'
end

Then (/^I fill 'SenhaC:' field$/) do
	fill_in "Senha", with: "123456"
end

Then(/^I fill 'Confirmação de Senha:' field$/) do
	fill_in 'Confirmação de Senha:', :with => '123456'
end