require_relative 'card'

# Generic Deck class to be inherited by specific game decks
class Deck
  attr_reader :cards
  
  def initialize
    @cards = build_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  # Different games will have different designs, so this method is left to be implemented by subclasses.
  def build_deck
    raise NotImplementedError, "Subclasses must implement this method"
  end
end