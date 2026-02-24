class Card
  attr_reader :rank, :suit
  attr_accessor :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end
end