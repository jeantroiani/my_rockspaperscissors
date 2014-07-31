Feature: Playing
	In order to play Rock Paper Scissors
	As a player
	I need to get two players

Scenario: you can select start a game with one player
	
	Given I am on the homepage
	Then I can click on comenzar partida
	Then I click on un jugador
	And I can fill in my name
	Then I can click on Piedra
	And I can see results


Scenario: you can select start a game with two players

	Given I am on the homepage
	Then I can click on comenzar partida
	Then I click on dos jugadores
	And I can fill in my name
	Then I should see esperando por un oponente
	Given I am on the play_two

	