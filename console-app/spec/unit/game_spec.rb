# typed: false
# frozen_string_literal: true

require 'factory_bot'

require './src/board'
require './src/player'

FactoryBot.define do
  factory :board do
  end
end

FactoryBot.define do
  factory :player do
    label { 'X' }
  end
end

RSpec.describe 'Game Board' do
  context 'Board' do
    it 'Contains 9 tiles' do
      board = build(:board)

      board.tiles.each do |row|
        expect(row.length).to eq 3
      end
      expect(board.tiles.length).to eq 3
    end

    it 'Convert board to string' do
      board = build(:board)

      expect(board.to_s).to eq " | | \n | | \n | | \n"
    end
  end
end

RSpec.describe 'Game Play' do
  context 'Play' do
    it 'Player x plays in row 0 column 0' do
      board = build(:board)

      player = Player.new('X')
      board.play(player, 0, 0)

      expect(board.tiles[0][0].player.label).to eq 'X'
    end

    it 'Multiple players in different tiles with success' do
      board = build(:board)

      player_x = build(:player)
      player_o = build(:player, label: 'O')

      board.play(player_x, 0, 0)
      board.play(player_o, 0, 1)

      expect(board.to_s).to eq "X|O| \n | | \n | | \n"
    end

    it 'Raise exception when playing in a occupied tile' do
      ERROR_MESSAGE = 'Position is already in use by another player'

      board = build(:board)

      player_x = build(:player)
      player_o = build(:player, label: 'O')

      board.play(player_x, 0, 0)

      expect do
        board.play(player_o, 0, 0)
      end.to raise_error(RuntimeError, ERROR_MESSAGE)
    end
  end
end
