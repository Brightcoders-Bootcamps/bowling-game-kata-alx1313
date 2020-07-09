# frozen_string_literal: true

require './bowling'
require './ball'
require './pins'

# describe
# it
# expect

describe Scorer do
  describe 'first_round' do
    it 'Genera y guarda la puntuacion de la primer ronda' do
      scorer = Scorer.new
      balls = Ball.new
      scorer.first_round(0)
      expect(balls.shot).to eq(scorer.score)
    end
  end
end
