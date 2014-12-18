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