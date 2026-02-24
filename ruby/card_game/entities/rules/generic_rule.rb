require_relative '../models/deck'

# GenericRule class that can be extended for specific card games. 
# It includes a deck and common methods for assigning points and dealing cards, which must be implemented by subclasses.
class GenericRule
  attr_reader :deck

  def initialize
    @deck = Deck.new
  end

  def start_game
    assign_card_values
    @deck.shuffle!
  end

  def assign_card_values
    raise NotImplementedError, "Subclasses must implement this method"
  end

  def deal_cards(players, card_count)
    raise NotImplementedError, "Subclasses must implement this method"
  end
end