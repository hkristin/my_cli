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
      candidate_array = results.collect do |result|
        new_candidate = self.create(result["name"], result["party"])
      end
     # binding.pry
    end
  end

  def self.display_candidates(selected_election, street_address)
    puts "Loading Candidates...".colorize(:light_cyan)
    sleep 3
    candidate_array = self.load_candidates(selected_election, street_address)
    candidate_array.each.with_index(1) do |candidate, index|
        puts "#{index}. #{candidate.display_name}".colorize(:cyan)
    end
  end
  