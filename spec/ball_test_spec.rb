# frozen_string_literal: true

require './ball'

# describe
# it
# expect

describe Ball do
  describe 'new_shot' do
    it 'Genera un numero, y lo guarda como puntuacion' do
      balls = Ball.new
      balls.new_shot
      expect(balls.shot).not_to be > 11
    end
  end

  describe 'second_shot' do
    it 'Genera un numero, pero con un limite modificado de un tiro anterior' do
      balls = Ball.new
      random = rand(0..10)
      balls.second_shot(random)
      expect(balls.shot).not_to be > random
    end
  end
end
