require_relative './deck'

# FrenchDeck class that inherits from Deck.
# It builds a standard deck of 52 cards that are modelled after French suited cards.
class FrenchDeck < Deck
  def build_deck
    suits = ['♥️', '♦️', '♣️', '♠️']
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    suits.product(ranks).map { |suit, rank| Card.new(rank, suit) }
  end 
end