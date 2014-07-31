require './lib/game' 

describe Game do 
	let(:player1) {double :player1, name: "Stephen"}
	let(:player2) {double :player2, name: "Enrique"}
	let(:game){Game.new}

	it "has no players when created" do
		expect(game.players).to eq []
	end

	context 'when playing' do

		it 'can store 2 players' do
			game.add_player(player1)
			game.add_player(player2)
			expect(game.players).to eq([player1,player2])

		end

		it 'can tell who is the player number one' do
			game.add_player(player1)
			game.add_player(player2)
			expect(game.player1).to eq player1
			
		end

		it 'can tell who is the player number two' do
			game.add_player(player1)
			game.add_player(player2)
			expect(game.player2).to eq player2
			
		end

		it 'player one picks rock, player two picks scissors' do
			game.add_player(player1)
			game.add_player(player2)
			allow(player1).to receive(:pick).and_return("Rock")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player1
		end

		it 'player one picks paper, player two picks scissors' do
			game.add_player(player1)
			game.add_player(player2)
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player2
		end

		it "player one picks paper, player two picks rock" do
			game.add_player(player1)
			game.add_player(player2)
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game.winner).to eq player1
		end

		it "can be a draw" do
			game.add_player(player1)
			game.add_player(player2)
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Paper")
			expect(game.winner).to eq "Draw"
		end

		it 'knows who I am' do
			game.add_player(player1)
			game.add_player(player2)
			expect(game.i_am(player1.name)).to eq player1

		end

		it 'knows who my opponent is' do
			game.add_player(player1)
			game.add_player(player2)
			expect(game.opponent(player1.name)).to eq player2

		end
	
	end
	
end