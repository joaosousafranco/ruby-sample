# frozen_string_literal: true

# Defines the tic tac toe player
class Player
  def initialize(label = ' ')
    @label = label
  end

  attr_accessor :label
end
