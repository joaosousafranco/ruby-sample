# frozen_string_literal: true

# Defines a single tile in the board game
class Tile
  def initialize
    @player = nil
  end

  attr_accessor :player
end

# Definesthe oard game
class Board
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
