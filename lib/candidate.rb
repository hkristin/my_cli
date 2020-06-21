class Candidate
  attr_accessor :name, :party
  
  @@all = []

  def initialize(name, party)
    @name = name
    @party = party
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
  
  def self.create(name, party)
    candidate = Candidate.new(name, party)
    candidate.save
    candidate
  end
    
  def self.load_candidates(selected_election, street_address)
      results = Civic_Info_Api.get_candidate_info(selected_election, street_address)
      candidate_array = results["contests"][selected_election-1]["candidates"]
      return_array = candidate_array.collect do |candidate|
        new_candidate = self.create(candidate["name"], candidate["party"])
      end
      return_array
    end


  def self.display_candidates(selected_election, street_address)
    puts "Loading Candidates...".colorize(:light_cyan)
    sleep 3
    candidate_array = self.load_candidates(selected_election, street_address)
    candidate_array.each.with_index(1) do |candidate, index|
        puts "#{index}. #{candidate.name} | #{candidate.party}".colorize(:cyan)
    end
  end
end