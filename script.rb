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
        display_board
        # check board
        check_board
        # switch player
        switch_player
      end
      play_again
    end

    def place_sign
      puts "Player #{current_player.id}'s turn"
      puts 'Input where you want to place the sign (for example 0 0)'
      pos_x, pos_y = user_input
      # p pos_x
      # p pos_y
      board[pos_y][pos_x] = current_player.sign
    end

    def user_input
      begin
        pos_x, pos_y = gets.chomp.split(' ')
        pos_x = Integer(pos_x)
        pos_y = Integer(pos_y)
        raise ArgumentError if (pos_x < 0 || pos_x > 2) || (pos_y < 0 || pos_y > 2) || board_pos_taken?(pos_x, pos_y)
      rescue ArgumentError
        puts 'Input out of range, please enter position again'
        retry
      end
      [pos_x, pos_y]
    end

    def board_pos_taken?(pos_x, pos_y)
      if board[pos_y][pos_x] == 'X' || board[pos_y][pos_x] == 'O'
        puts 'Position taken'
        true
      else
        false
      end
    end

    def switch_player
      self.current_player = current_player == @players[0] ? @players[1] : @players[0]
    end

    def check_board
      sign = current_player.sign
      for i in 0...board.length do
        # horizontal check
        if board[i][0] == sign && board[i][1] == sign && board[i][2] == sign
          display_winner
        # vertical check
        elsif board[0][i] == sign && board[1][i] == sign && board[2][i] == sign
          display_winner
        end
      end
      # diagonal check
      if [board[0][0], board[1][1], board[2][2]].all? { |pos| pos == sign }
        display_winner
      elsif board[0][2] == sign && board[1][1] == sign && board[2][0] == sign
        display_winner
      end
      display_tie if board_full?
    end

    def display_winner
      puts "Player #{current_player.id} win !!!"
      self.game_stop = true
    end

    def display_tie
      puts 'Tie !!'
      self.game_stop = true
    end

    def board_full?
      if board.flatten.any? { |pos| pos == '-' }
        false
      else
        true
      end
    end

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

    def play_again
      puts 'Do you want to play another round ? (y/n)'
      decision = gets.chomp.downcase
      return unless decision == 'y'

      reset_game
      game_start
    end

    def reset_game
      self.current_player = @players[0]
      self.board = Array.new(3) { Array.new(3, '-') }
      self.game_stop = false
    end
  end

  # player class
  class Player
    attr_reader :id, :sign

    def initialize(id, sign)
      @id = id
      @sign = sign
    end
  end

  obj = Game.new
  obj.game_start
end
