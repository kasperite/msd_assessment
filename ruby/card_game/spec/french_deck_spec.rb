require_relative './spec_helper'
require_relative '../entities/models/french_deck'

describe FrenchDeck do
  let(:deck) { FrenchDeck.new }

  describe '#initialize' do
    it 'creates a standard deck of 52 cards' do
      expect(deck.cards.size).to eq(52)
    end
  end

  describe '#shuffle!' do
    it 'shuffles the deck of cards' do
      original_order = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq(original_order)
    end
  end
end