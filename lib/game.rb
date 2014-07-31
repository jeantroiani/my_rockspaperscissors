class Game 

	def initialize
		# @player1 = player1
		# @player2 = player2
		@players = []
	end

	BEATS = {piedra: :tijeras, tijeras: :papel, papel: :piedra}

	attr_reader :players, :player1, :player2

	def winner
		return "Draw" if player1.pick == player2.pick
		return player1  if BEATS[normalize(player1.pick)] == normalize(player2.pick)
		player2
	end

	def normalize(pick)
		pick.downcase.to_sym
	end

	def players_full?
		players.count == 2
	end

	def add_player(player)
	players << player
	end

	def player1
		players.first
	end

	def player2
		players.last
	end

	def i_am(player_name)
		players.select{|player|player.name== player_name}.first
	end

	def opponent(player_name)
		players.reject{|player|player.name== player_name}.first
	end

end

