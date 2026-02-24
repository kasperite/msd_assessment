class Player
  attr_accessor :name, :hand, :points
  
  def initialize(name)
    @name = name
    @hand = []
    @points = 0
  end
end