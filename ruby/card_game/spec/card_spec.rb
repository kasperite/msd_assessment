require_relative './spec_helper'
require_relative '../entities/models/card'

describe Card do
  let(:card) { Card.new('Ace', '♠️') }

  describe '#initialize' do
    it 'sets the rank and suit' do
      expect(card.rank).to eq('Ace')
      expect(card.suit).to eq('♠️')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the card' do
      expect(card.to_s).to eq('Ace of ♠️')
    end
  end
end