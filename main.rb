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
      puts "Press 1 to be a codebreaker or 2 to be a codemaker."
      while gets.chomp != "1" do
        puts "Enter '1' to be a codebreaker or '2' to be a codemaker."
      end
    end

    def codebreaker_mode
      puts "You're the codebreaker!"
      secret_code = @computer_player.get_computer_secret_code
      p secret_code
      attempt_number = 1
      puts "Attempt number: #{attempt_number}"
      loop do
        guess = @human_player.get_human_guess
        p secret_code
        p guess
        puts "Attempt number: #{attempt_number}"
        feedback = get_codebreaker_feedback(secret_code, guess)
        break if check_codebreaker_win(feedback) || check_codebreaker_lose(feedback, attempt_number)
        attempt_number += 1
        end
      end
    end

    def get_codebreaker_feedback(secret_code, guess)
      puts "Each black means you have a correct color in its correct place."
      puts "Each white means you have a correct color in its incorrect place."
      black = secret_code.zip(guess).count{|i| i.inject(:eql?)}
      white = guess.uniq.count{|i| secret_code.include?(i)}
      result = Array.new(4, '')
      white.times { result.unshift('white').pop }
      black.times { result.unshift('black').pop }
      p result
      result
    end

    def check_codebreaker_win(feedback)
      if feedback == ["black", "black", "black", "black"]
        puts "Congratulations! You win!"
        true
      else
        false
      end
    end

    def check_codebreaker_lose(feedback, attempt_number) 
      puts "entered check_codebreaker_lose!"
      if (feedback != ["black", "black", "black", "black"]) && (attempt_number == 12)
        puts "Sorry, you lose!"
        true
      else
        false
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

include Mastermind

Game.new
