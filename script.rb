# frozen_string_literal: true

# tit tac toe game
module TitTacToe
  # game class
  class Game
    attr_accessor :board

    def initialize
      @board = Array.new(3) { Array.new(3, '-') }
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
  end

  obj = Game.new
  obj.display_board
end
