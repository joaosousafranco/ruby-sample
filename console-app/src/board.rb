# typed: true
# frozen_string_literal: true

# (1) Bring T::Sig into scope:
require 'sorbet-runtime'

# Defines a single tile in the board game
class Tile
  def initialize
    @player = nil
  end

  attr_accessor :player
end

# Define the board game
class Board
  # (2) extend T::Sig to get access to `sig` for annotations:
  extend T::Sig

  def initialize
    @tiles = []

    (0...3).each do |row|
      tiles[row] = Array.new(3)
      (0...3).each do |column|
        tiles[row][column] = Tile.new
      end
    end
  end

  attr_reader :tiles

  sig { params(player: Player, row: Integer, column: Integer).returns(RuboCop::Cop::Lint::Void) }
  def play(player, row, column)
    unless tiles[row][column].player.nil?
      raise 'Position is already in use by another player'
    end

    tiles[row][column].player = player
  end

  def to_s
    board_string = ''

    @tiles.each do |row|
      row.each_with_index do |tile, index|
        board_string += tile.player.nil? ? ' ' : tile.player.label
        board_string += '|' if index < row.length - 1
      end
      board_string += "\n"
    end

    board_string
  end
end
