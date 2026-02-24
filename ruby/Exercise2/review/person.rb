require 'date'

module Review
  class Person
    attr_reader :name, :dob

    def initialize(name, dob)
      @name = name
      @dob = dob || default_dob
    end

    def default_dob
      Date.today - (15 * 365)
    end
  end
end