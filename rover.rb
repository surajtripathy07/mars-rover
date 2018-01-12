require './plateau'
# Rover to be placed and manipulated
class Rover
  attr_accessor :y_coordinate
  attr_accessor :x_coordinate
  attr_accessor :orientation

  def initialize(y, x, o)
    @y_coordinate = y.to_i
    @x_coordinate = x.to_i
    @orientation = o
  end

  def move
    case @orientation
    when :e then
      @x_coordinate += 1
    when :w then
      @x_coordinate -= 1
    when :s then
      @y_coordinate += 1
    when :n then
      @y_coordinate -= 1
    end
  end

  def turn(align)
    if align == :l
      case @orientation
      when :e then
        @orientation = :n
      when :w then
        @orientation = :s
      when :s then
        @orientation = :e
      when :n then
        @orientation = :w
      end
    elsif align == :r
      case @orientation
      when :e then
        @orientation = :s
      when :w then
        @orientation = :n
      when :s then
        @orientation = :w
      when :n then
        @orientation = :e
      end
    end
  end
end
