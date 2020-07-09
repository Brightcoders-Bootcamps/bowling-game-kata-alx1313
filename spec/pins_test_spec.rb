# frozen_string_literal: true

require './pins'

# describe
# it
# expect

describe Pins do
  describe 'reset_pins' do
    it 'reinicia el valor de pins' do
      Pins.new
      expect(Pins.reset_pins).not_to be nil
    end
  end

  describe 'see_pins' do
    it 'muestra la cantidad de pinos que quedan en pie' do
      Pins.new
      Pins.reset_pins
      expect(Pins.see_pins).to eq(10)
    end
  end

  describe 'limit' do
    it 'reduce la cantidad de pinos en pie segun lo obtenido' do
      Pins.new
      Pins.reset_pins
      expect(Pins.limit(6)).to eq(4)
    end
  end
end
