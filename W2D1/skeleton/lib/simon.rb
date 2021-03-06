class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

    until self.game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless self.game_over
      round_success_message
      sleep(2)
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    self.seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(1)
    end
  end

  def require_sequence
    puts "Input the colors in the sequence and
    hit enter between each color selection."
    self.seq.each do |color|
      input = gets.chomp
      if color != input
        self.game_over = true
        break
      end
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! You remembered the sequence this round. Try the next one."
  end

  def game_over_message
    puts "Game over! Please try again."
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

# s = Simon.new
# s.play
