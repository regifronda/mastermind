module Mastermind
  COLOR_CHOICES = %w(r g b y c p)

  class Game
    def initialize
      beginning_prompt

      @computer_player = ComputerPlayer.new([])
      @human_player = HumanPlayer.new([])

      codebreaker_mode
    end

    def beginning_prompt
      puts "Codemaker creates a four-color code from the six colors: \nred, green, blue, yellow, cyan, and purple."
      puts "The colors will be shortened to \'r,\' \'g,\' \'b,\' \'y,\' \'c,\' \'p,\' respectively."
    end

    def codebreaker_mode
      puts "You're the codebreaker!"
      secret_code = @computer_player.get_computer_secret_code
      end
    end
  end

  class ComputerPlayer
    attr_accessor :computer_secret_code

    def initialize(computer_secret_code)
      @computer_secret_code = computer_secret_code
    end

    def get_computer_secret_code
      @computer_secret_code = 4.times.map { |color| COLOR_CHOICES.sample }
    end
  end

  class HumanPlayer
    attr_accessor :human_guess

    def initialize(human_guess)
      @human_guess = human_guess
    end
  end

include Mastermind

Game.new
