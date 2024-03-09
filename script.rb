# frozen_string_literal: true

# tit tac toe game
module TitTacToe
  # game class
  class Game
    attr_accessor :board, :game_stop, :current_player

    def initialize
      @board = Array.new(3) { Array.new(3, '-') }
      @game_stop = false

      # create player objects
      @players = [Player.new(1, 'X'), Player.new(2, 'O')]
      @current_player = @players[0]
      puts 'Tic Tac Toe Game'
    end

    def game_start
      display_board

      until game_stop
        # turn start
        place_sign
        # display board
        # switch player
        # check board
      end
    end

    def place_sign
      puts "Player #{current_player.id}'s turn"
      pos_x, pos_y = get_input
      p pos_x
      p pos_y
    end

    def get_input
      puts 'Input where you want to place the sign (for example 0 0)'
      pos_x, pos_y = gets.chomp.split(' ')
      pos_x = pos_x.to_i
      pos_y = pos_y.to_i
      if !(pos_x.is_a? Integer) || (pos_x < 0 || pos_x > 2) || !(pos_y.is_a? Integer) || (pos_y < 0 || pos_y > 2)
        puts 'Input out of range'
        pos_x, pos_y = get_input
      end
      [pos_x, pos_y]
    end

    def check_board; end

    def display_board
      puts '   0     1     2  '
      puts '      |     |     '
      puts "0  #{board[0][0]}  |  #{board[0][1]}  |  #{board[0][2]}  "
      puts ' -----|-----|-----'
      puts "1  #{board[1][0]}  |  #{board[1][1]}  |  #{board[1][2]}  "
      puts ' -----|-----|-----'
      puts "2  #{board[2][0]}  |  #{board[2][1]}  |  #{board[2][2]}  "
      puts '      |     |     '
    end
  end

  # player class
  class Player
    attr_accessor :id, :sign

    def initialize(id, sign)
      @id = id
      @sign = sign
    end
  end

  obj = Game.new
  obj.game_start
end
