class Election
   attr_accessor :name
  
  @@all = []

  def initialize(name, date)
    @name = name
    @date = date
   
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

  def self.load_elections(zipcode)
  #retrieves json data from api
  results = civic_info_api.get_election_data(zipcode)
    results.collect do |result|
      election = self.new(name[:name])
      election.date = result[:date]
    end
  end

  def self.display_elections
    #invokes load_elections, iterates to display
    self.all.each do |election|
      puts "#{election.name}, #{election.date}".colorize(:magenta)
    end
  end
end