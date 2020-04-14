# typed: strict
# frozen_string_literal: true

require './src/board'
require './src/player'

board = Board.new
player_x = Player.new('X')
player_o = Player.new('O')

puts board

puts '=========== Play ==========='

board.play(player_x, 0, 0)
board.play(player_o, 0, 1)

puts board
