class Election
   attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name
   
  end
  
  def self.all
    @@all
  end
  
   def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
   def self.create(name)
    election = Election.new(name)
    election.save
    election
  end

  def self.load_elections(street_address)
  results = Civic_Info_Api.get_election_data(street_address)
  contests = results["contests"]
    contests.collect do |contest|
      new_election = Election.create(contest["office"])
     #binding.pry
    end
  end

  def self.display_elections(street_address)
    elections = self.load_elections(street_address)
    elections.each_with_index do |election, index|
      puts "#{index + 1}. #{election.name}".colorize(:magenta)
    end
  end
end