module Review
  class BirthingUnit
    def initialize
      @people = []
    end

    def get_people(i)
      i.times do
        begin
          name = %W[Bob Betty].sample
          # Adds new people to the list
          @people << Review::Person.new(name, Date.today - (rand(18..85) * 365))
        rescue => e
          puts "Something failed in user creation: #{e.message}"
          []
        end
      end
      @people
    end

    def get_married_name(person, lastname)
      if lastname.include?("test")
        person.name
      else
        "#{person.name} #{lastname}"
      end
    end

    def get_people_by_age_and_name(name, age_threshold, older_than_threshold: false)
      return @people.select { |x| x.name == name } unless older_than_threshold
        
      @people.select { |x| x.name == name && x.dob >= (Date.today - (age_threshold * 356)) }
    end
  end
end