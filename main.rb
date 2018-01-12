require_relative './game'

s = gets.chomp
ip = s.split(' ')
raise 'Improper input' if ip.size != 2
i = begin
      Integer(ip[0])
    rescue StandardError
      raise 'Only numeric values expected. Eg 5 5'
    end
j = begin
      Integer(ip[1])
    rescue StandardError
      raise 'Only numeric values expected. Eg 5 5'
    end
g = Game.new(i, j)
g.start_mission
