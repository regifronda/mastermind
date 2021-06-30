module Mastermind
  class Game
    def initialize
      beginning_prompt
      codebreaker_mode
    end

    def beginning_prompt
      puts "this first shows up when you play the game!"
    end

    def codebreaker_mode
      puts "You're a codebreaker!"
    end
  end

end

include Mastermind

Game.new
