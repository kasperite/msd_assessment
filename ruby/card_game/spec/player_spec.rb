require_relative './spec_helper'
require_relative '../entities/models/player'

describe Player do
  let(:player) { Player.new('Alice') }

  describe '#initialize' do
    it 'sets the name and initializes an empty hand and zero points' do
      expect(player.name).to eq('Alice')
      expect(player.points).to eq(0)
      expect(player.hand).to eq([])
    end
  end
end