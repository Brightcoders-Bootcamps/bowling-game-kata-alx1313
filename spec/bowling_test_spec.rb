# frozen_string_literal: true

require './bowling'

# describe
# it
# expect

describe Ball do
  describe 'new_shot' do
    it 'Genera un numero, y lo guarda como puntuacion' do
      expect(Ball.shot).not_to be > 11
    end
  end
end
