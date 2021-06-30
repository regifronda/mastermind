module Mastermind
  class Game
    def initialize
      beginning_prompt
      codebreaker_mode
    end

    def beginning_prompt
      puts "Codemaker creates a four-color code from the six colors: \nred, green, blue, yellow, cyan, and purple."
      puts "The colors will be shortened to \'r,\' \'g,\' \'b,\' \'y,\' \'c,\' \'p,\' respectively."
    end

    def codebreaker_mode
      puts "You're a codebreaker!"
    end
  end

  class ComputerPlayer

  end
end

include Mastermind

Game.new
