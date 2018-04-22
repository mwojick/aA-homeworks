class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    reset_game
    game_over_message
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
    end
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts "Current seq: #{@seq}"
    # sleep(2)
    # system("clear")
  end

  def require_sequence
    puts "repeat the sequence: (i.e. red, blue, green, yellow)"
    given = []
    until given.length == @sequence_length
      puts "next color"
      given << $stdin.gets.chomp
    end
    @game_over = true if given != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "round success!"
  end

  def game_over_message
    puts "game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end


if __FILE__ == $0
  game = Simon.new
  game.play
end