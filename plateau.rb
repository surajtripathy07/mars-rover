# Corresponds to Mars Plateau where Rovers are to be placed
class Plateau
  attr_accessor :board
  def initialize(height, width)
    @board = Array.new(height) { Array.new(width) }
  end

  # validate the position and if possible place the rover in the position
  def place_rover(rover)
    validate_pos(rover.y_coordinate, rover.x_coordinate)
    @board[rover.y_coordinate][rover.x_coordinate] = rover
  end

  # throw error if position is outside board or if a rover is already present
  def validate_pos(i, j)
    raise "Out of bound #{i} #{j}" if i < 0 || j < 0 || i >= @board.size || j >= @board[0].size
    raise "Already a rover exist on #{i} #{j}" if @board[i][j]
  end
end
