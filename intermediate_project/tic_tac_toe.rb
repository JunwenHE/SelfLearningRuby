=begin
  Author: Junwen HE
  Date: 3/MAR/2019
  This is a tic-tac-toe program to allow two players to play this game.
  Each player should select a empty number between 1 ~ 9 then display "X" or "O" symbol.
  Class game is used to set up game process between 2 players.
  Class board refers to the game setting which contains board layout, receiving user input,
  empty checking and game conditions checking.
=end
class Game
  # Initial variables declaration
  def initialize
    @board = Board.new
    @player1_symbol = "X"
    @player2_symbol = "O"
    @player1_name = "Player 1"
    @player2_name = "Player 2"
    @turn = 0
    turns
  end

  # Game start with player 1, finished by game conditions
  def turns
    while @board.game_check == false
      player_process(@player1_name,@player1_symbol,@turn)
      break if @board.game_check == true

      player_process(@player2_name,@player2_symbol,@turn)
    end
    @board.display
    print "\nDone \n"
  end

  # Player action process, turn increased once each process finished
  def player_process(player_name,player_symbol,turn)
    @board.display
    print "#{player_name} please choose a digit: "
    number = gets.chomp.to_i
    @board.check_space(number)

    while @board.check_space == true
      print "#{player_name} please choose again: "
      number = gets.chomp.to_i
      @board.check_space(number)
    end

    @board.draw(number,player_symbol)
    @board.game_check(player_symbol, player_name,turn)
    turn + 1
  end
end

class Board
  def initialize
    @space = *(1..9)
  end

  def display
    print "\n#{@space[0]}|#{@space[1]}|#{@space[2]}\n"
    print "- - - \n"
    print "#{@space[3]}|#{@space[4]}|#{@space[5]}\n"
    print "- - - \n"
    print "#{@space[6]}|#{@space[7]}|#{@space[8]}\n"
  end

  # Check player selects empty space or not
  def check_space(element)
    print "\nInvaild input \n" if @space[element - 1] == "X" || @space[element - 1] == "O"
  end

  def draw(element, player_symbol)
    @space[element - 1] = player_symbol
  end

  # Game conditions check by nested iterators
  def game_check(player_symbol, player_name,turn)
    win_conditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    win_conditions.each do |condition|
      print "\n#{player_name} win!" if condition.all?{|element| @space[element]==player_symbol}
    end
    print "\nTie game!" if turn == 8
  end
end

game = Game.new