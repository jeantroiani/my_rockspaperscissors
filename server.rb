require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base
TWOGAME=Game.new

enable :sessions

  configure :production do
    require 'newrelic_rpm'
  end

  get '/' do
    erb :index
  end

  get '/number_players' do  
    erb :number_players
  end

  post '/number_players' do
    if params[:selection] == "1"
      redirect '/new-game'
    else 
      redirect '/new-game-two'
    end
  end

# ________1_Player____________

  get '/new-game' do
  	erb :new_player
  end

  post '/register' do 
  	@player = params[:name]
  	erb :play	
  end

  post "/play" do
  	# player1 = Player.new(params[:name])
  	session[:player_name]=params[:name]
    player1= Player.new(session[:player_name])
    player1.picks = params[:pick]
  	player2 = generate_player2
    @game = Game.new
    @game.add_player(player1)
    @game.add_player(player2)
  	erb :outcome
  end

  def generate_player2
  	choice = ["Piedra","Papel","Tijeras"].sample

  	player2 = Player.new(:player2)
  	player2.picks = choice
  	player2
  end

# ________2_Players____________
  
  get '/new-game-two' do
    if !TWOGAME.players_full?
    erb :new_player_two
    else
      puts "Disculpe, este cuarto esta lleno"
    end
  end

  post '/register_two' do
   session[:player_name]=params[:name]
   @player=Player.new(session[:player_name])
   TWOGAME.add_player(@player)
   redirect '/waiting_room'
  end

  get '/waiting_room' do

   if TWOGAME.players_full?
     puts TWOGAME.players_full?
     redirect '/play_two'
   end
     erb :waiting_room  
  end

  get '/play_two' do
    erb :play_two
  end

  post '/play_two' do
    @game=TWOGAME
    @player=TWOGAME.i_am(session[:player_name])
    @opponent=TWOGAME.opponent(session[:player_name])
    @player.picks = params[:pick]
    if @opponent.pick.nil?
      redirect '/waiting_room_two'
    else
      erb :outcome 
    end
  end

  get '/waiting_room_two' do
    @game=TWOGAME
    @player=TWOGAME.i_am(session[:player_name])
    @opponent=TWOGAME.opponent(session[:player_name])
    if @opponent.pick.nil?
      erb :waiting_room_two
    else   
      erb :outcome 
    end 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
