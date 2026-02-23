require_relative 'spec_helper'
require_relative '../CodeToRefactor'

describe Review::BirthingUnit do
  let(:birthing_unit) { Review::BirthingUnit.new }

  describe '#get_people' do
    it 'returns an array of people' do
      people = birthing_unit.get_people(5)
      expect(people).to be_an(Array)
      expect(people.size).to eq(5)
    end

    it 'handles exceptions during people creation' do
      allow(Review::People).to receive(:new).and_raise(StandardError.new("Boom!"))
      expect { birthing_unit.get_people(5) }.to raise_error("Something failed in user creation")
    end
  end

  describe "#get_married" do
    let(:person) { Review::People.new("Bob", DateTime.now - (10 * 356)) }
    it 'returns the married name for a person' do
      expect(birthing_unit.get_married(person, 'Married')).to eq("Bob Married")
    end

    context 'when lastname contains "test"' do
      it 'returns person name without last name' do
        expect(birthing_unit.get_married(person, 'test')).to eq("Bob")
      end
    end
  end
end