# frozen_string_literal: true

# Class pins created, their function is to set a limit to the points we can obtain
class Pins
  attr_accessor :pins

  def self.reset_pins
    @pins = 10
  end

  def self.see_pins
    @pins
  end

  def self.limit(pins)
    @pins -= pins
  end
end
