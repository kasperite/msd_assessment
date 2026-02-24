require_relative 'spec_helper'
require_relative '../review/birthing_unit'
require_relative '../review/person'

describe Review::BirthingUnit do
  let(:birthing_unit) { Review::BirthingUnit.new }

  describe '#get_people' do
    it 'returns an array of people' do
      people = birthing_unit.get_people(5)
      expect(people).to be_an(Array)
      expect(people.size).to eq(5)
    end

    it 'handles exceptions during people creation' do
      allow(Review::Person).to receive(:new).and_raise(StandardError.new("Boom!"))
      expect { birthing_unit.get_people(5) }.to output(/Something failed in user creation: Boom!/).to_stdout
    end
  end

  describe "#get_married_name" do
    let(:person) { Review::Person.new("Bob", DateTime.now - (10 * 356)) }
    it 'returns the married name for a person' do
      expect(birthing_unit.get_married_name(person, 'Married')).to eq("Bob Married")
    end

    context 'when lastname contains "test"' do
      it 'returns person name without last name' do
        expect(birthing_unit.get_married_name(person, 'test')).to eq("Bob")
      end
    end
  end

  describe "#get_people_by_age_and_name" do
    # people data is randomised so we manually set the list of people to ensure consistent test results
    let(:age) { 30 }
    before do
      birthing_unit.instance_variable_set(:@people, [
        Review::Person.new("Bob", Date.today - (age * 365)),
        Review::Person.new("Bob", Date.today - (20 * 365))
      ])
    end

    it 'returns all people with the specified name' do
      people = birthing_unit.get_people_by_age_and_name("Bob", age)
      expect(people.count).to eq(2)
      expect(people).to all(have_attributes(name: "Bob"))
    end

    it 'returns people older than the age threshold when older_than_threshold is true' do
      people = birthing_unit.get_people_by_age_and_name("Bob", age, older_than_threshold: true)
      expect(people.count).to eq(1)
    end
  end
end