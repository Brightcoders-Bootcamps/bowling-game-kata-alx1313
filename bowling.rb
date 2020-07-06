# frozen_string_literal: true

# Clase Pinos
class Pins
  attr_accessor :pins

  def initialize
    @pins = 10
  end

  def self.reset_pins(pins)
    @pins = pins
  end

  def self.see_pins
    @pins
  end

  def self.limit(pins)
    @pins -= pins
  end
end

# Clase bola
class Ball
  attr_accessor :shot, :tries, :rounds
  def new_games
    @shot = 0
    @tries = 0
    @rounds = 0
  end

  def new_shot
    @tries = 2
    @shot = rand(0..10)
    @tries -= 1
  end

  def second_shot(limit)
    @shot = rand(0..limit)
    @tries -= 1
  end
end
# clase marcador
class Scorer
  attr_accessor :total_points, :scorer, :multiplier, :multiplier_active, :score
  Pins.new
  @balls = Ball.new
  def self.new_game
    @total_points = 0
    @scorer = [0] * 21
    @multiplier = 1
    @multiplier_active = false
    Pins.reset_pins(10)
    @balls.new_games
  end

  def self.multi_score(pointer)
    @score = @multiplier.positive? ? pointer * 2 : pointer * 1
    @multiplier -= 1
  end

  def self.first_round(round)
    @balls.new_shot
    Pins.reset_pins(10)
    Pins.limit(@balls.shot)
    Scorer.multi_score(@balls.shot)
    @total_points += @score
    @scorer[round] = @score
    @balls.tries -= 1
  end

  def self.second_round(round)
    @balls.second_shot(Pins.see_pins)
    if @balls.shot > Pins.see_pins
      Scorer.spare(round)
    else
      Scorer.multi_score(@balls.shot)
      @total_points += @score
      @scorer[round] = @score
    end
  end

  def self.spare(rounds)
    Scorer.multi_score(pins.pins)
    @total_points += @score
    @scorer[rounds] = @score
    @multiplier += 1
  end

  def self.strike(rounds)
    Scorer.multi_score(@balls.shot)
    @total_points += @score
    @scorer[rounds] = @score
    @scorer[rounds + 1] = 0
    @multiplier += 2
    @balls.tries = 0
    @balls.rounds += 1
  end

  def self.game(round)
    Scorer.first_round(round)
    @balls.shot == 10 ? Scorer.strike(round) : Scorer.second_round(round)
    #puts @scorer[round]
  end

  def self.ingame(round)
    if round == 19 && Pins.see_pins.zero?
      Scorer.first_round(round)
    else
      Scorer.game(round)
    end
  end

  def start_game
    Scorer.new_game
    [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].each do |n|
      n == 19 ? break : Scorer.ingame(n)
    end
  end
end

gameplay = Scorer.new
gameplay.start_game
