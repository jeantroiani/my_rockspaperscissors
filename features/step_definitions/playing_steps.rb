
Given /^(?:|I )am on homepage/ do |homepage|
	visit '/'
end

Then(/^I can click on comenzar partida$/) do
  click_link("Comenzar partida")
end

Then(/^I click on dos jugadores$/) do
  click_button("2 Jugadores")
end

Then(/^I can fill in my name$/) do
  fill_in "name", with: "Stephen"
  click_button("A la carga!")
end

Then(/^I should see esperando por un oponente$/) do
  expect(page).to have_content("Esperando por")
end

Then(/^I click on un jugador$/) do
  click_button("1 Jugador")
end

Then(/^I can click on Piedra$/) do
  click_button("Piedra")
end

Then(/^I can see results$/) do
   expect(page).to have_content("Resultado:")
end








