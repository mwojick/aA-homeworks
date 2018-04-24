class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
    raise "Invalid starting cup" if start_pos == 6
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand = []
    until @cups[start_pos].empty?
      stones_in_hand << @cups[start_pos].pop
    end

    current_pos = start_pos
    until stones_in_hand.empty?
      current_pos += 1
      current_pos = 0 if current_pos > 13
      if current_pos == 13 && current_player_name == @name1
        next
      elsif current_pos == 6 && current_player_name == @name2
        next
      else
        @cups[current_pos] << stones_in_hand.pop
      end
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).all? {|i| @cups[i].empty?}
    return true if (7..12).all? {|i| @cups[i].empty?}
    false
  end

  def winner
    player1 = @cups[6].length
    player2 = @cups[13].length

    if player1 == player2
      :draw
    elsif player1 > player2
      @name1
    else
      @name2
    end
  end
end
