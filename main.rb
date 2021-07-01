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
      guess = @human_player.get_human_guess
      p secret_code
      p guess
      get_feedback(secret_code, guess)
    end

    def get_feedback(secret_code, guess)
      black = secret_code.zip(guess).count{|i| i.inject(:eql?)}
      white = guess.uniq.count{|i| secret_code.include?(i)}
      result = Array.new(4, '')
      black.times { result.unshift('black').pop }
      white.times { result.unshift('white').pop }
      p result
      result
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
  
    def get_human_guess
      colors = ask_for_human_guess
      if validate_human_guess(colors)
        puts "statement on validate_human_guess"
      end
      colors
    end

    def ask_for_human_guess
      puts "Enter your guess in the following format: rybb"
      gets.strip.downcase.split(//)
    end

    def validate_human_guess(colors)
      if colors.is_a?(Array) && colors.size == 4
        puts "Validated!"
        true
      else
        puts "Your guess is in the improper format!"
      end
    end
  end
end

include Mastermind

Game.new