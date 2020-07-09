# frozen_string_literal: true

# Clase Ball, where we get the points for every shot we'll do
class Ball
  attr_accessor :shot
  def new_games
    @shot = 0
  end

  def new_shot
    @shot = rand(0..10)
  end

  def second_shot(limit)
    @shot = rand(0..limit)
  end
end
