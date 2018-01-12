require_relative './plateau'
require_relative './rover'
# Handles the game rover placing logic and plateau manipulation and orientation
class Game
  attr_accessor :plateau

  def initialize(i, j)
    @plateau = Plateau.new(i + 1, j + 1)
  end

  def start_mission
    # loop through all the rovers, break when empty rover position is entered
    loop do
      begin
        rover = gets
        rover ||= ''
        rover = rover.chomp.split(' ')
        # Breaking condition
        break if rover.empty?

        # actuate the rover according to the passed input, raise error
        # if already present rover in the path
        @plateau.validate_pos(rover[1].to_i, rover[0].to_i)
        r = Rover.new(rover[1], rover[0], get_orientation(rover[2]))
        actuation = gets.chomp.split('')
        actuation.each do |char|
          case char.downcase
          when 'l', 'r' then
            r.turn(get_orientation(char))
          when 'm' then
            r.move
            @plateau.validate_pos(r.y_coordinate, r.x_coordinate)
          end
        end

        # place rover in the final position
        @plateau.place_rover(r)

        # print the orientation and x, y co-ordinate of rover
        ornt = if r.orientation == :n
                 'S'
               elsif r.orientation == :s
                 'N'
               else
                 r.orientation.to_s.upcase
               end

        puts "#{r.x_coordinate} #{r.y_coordinate} #{ornt}"
      rescue SystemExit, Interrupt
        raise
      rescue Exception => e
        puts "Error while placing/moving a rover: #{e.message}"
      end
    end
  end

  # gets orientation from the passed string
  def get_orientation(align)
    case align.downcase
    when 'n' then
      o = :s
    when 's' then
      o = :n
    when 'e' then
      o = :e
    when 'w' then
      o = :w
    when 'l' then
      o = :r
    when 'r' then
      o = :l
    end
    o
  end
end
