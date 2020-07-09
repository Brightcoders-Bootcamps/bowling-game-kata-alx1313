# frozen_string_literal: true

require './ball'
require './pins'

# clase marcador
class Scorer
  attr_accessor :total_points, :scorer, :multiplier, :score
  Pins.new
  @balls = Ball.new
  class << self
    def new_game
      @total_points = 0
      @scorer = [0] * 20
      @multiplier = 0
      @score = 0
      Pins.reset_pins
      @balls.new_games
    end

    def multiplier(pointer)
      print @multiplier
      @score = @multiplier.positive? ? pointer * 2 : pointer
      puts @balls.shot
      @multiplier -= 1 if @multiplier.positive?
    end

    def first_round(round)
      # puts 'primer disparo...'
      Pins.reset_pins
      @balls.new_shot
      Pins.limit(@balls.shot)
      Scorer.multiplier(@balls.shot)
      @scorer[round] = @score
      Scorer.strike(round) if @balls.shot == 10
    end

    def second_round(round)
      @balls.second_shot(Pins.see_pins)
      if @balls.shot > Pins.see_pins
        Scorer.spare(round)
      else
        # puts 'segundo disparo...'
        Scorer.multiplier(@balls.shot)
        @scorer[round] = @score
        @multiplier = 0
      end
    end

    def spare(rounds)
      # puts 'spare!'
      Scorer.multiplier(@balls.shot)
      @scorer[rounds] = @score
      @multiplier = 1
    end

    def strike(rounds)
      # puts 'chuza!'
      # Scorer.multiplier(@balls.shot)
      # @scorer[rounds] = @score
      @scorer[rounds + 1] = 0
      @multiplier = 2
    end

    def ingame(round)
      Scorer.first_round(round) if Pins.see_pins.zero?
    end

    def start_game
      Scorer.new_game
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].each do |round|
        if round.even?
          Scorer.first_round(round)
        else
          @balls.shot == 10 ? next : Scorer.second_round(round)
        end

        @total_points += @score
        Scorer.ingame(round) if round == 19
      end
      print @scorer
      puts @total_points
    end
  end
end

Scorer.new
Scorer.start_game
