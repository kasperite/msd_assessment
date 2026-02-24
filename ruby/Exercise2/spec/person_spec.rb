require_relative 'spec_helper'
require_relative '../review/person'

describe Review::Person do
  let(:dob) { Date.parse("2020-10-01") }

  subject { Review::Person.new("Bob", dob) }
  it 'create people instance with provided name and date of birth' do
    expect(subject.name).to eq("Bob")
    expect(subject.dob).to eq(dob)
  end

  context 'when dob is missing' do
    let(:dob) { nil }
    it 'sets a default dob' do
      expect(subject.dob).to be_a(Date)
    end
  end
end