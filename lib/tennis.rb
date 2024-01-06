class Tennis

  attr_accessor :player1, :player2
  attr_accessor :point1,  :point2

  SCORE_STRING = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty"
  }

  def initialize()
    @player1 = "Henry"
    @player2 = "Jack"
    @point1 = 0
    @point2 = 0

    score
  end

  def add_point(player)
    if player == @player1
      @point1 += 1
    elsif player == @player2
      @point2 += 1
    else
      raise "Unknown player"
    end
  end

  def score
    is_even = @point1 == @point2
    is_adv = @point1 > 3 && @point2 > 3 && (@point1 - @point2).abs == 1
    before_duece = @point1 < 3 && @point2 < 3

    if before_duece
      return "#{SCORE_STRING[@point1]} All" if is_even
      "#{SCORE_STRING[@point1]} #{SCORE_STRING[@point2]}"
    else
      return "Deuce" if is_even
      return "#{score_leader} adv" if is_adv
      "#{score_leader} win"
    end
  end

  private

  def score_leader
    @point1 > @point2 ? @player1 : @player2
  end
end
