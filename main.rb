module Mastermind
  class Game
    def initialize
      beginning_prompt
    end

    def beginning_prompt
      puts "this first shows up when you play the game!"
    end
  end

end

include Mastermind

Game.new
