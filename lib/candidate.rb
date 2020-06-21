class Candidate
  attr_accessor :name, :party, :age, :gender
  
  @@all = []

  def initialize(name)
    @name = name
    @party = party
    @age = age
    @gender = gender
    @@all << self
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
    candidate = Candidate.new(name)
    candidate.save
    candidate
  end
    
  def self.load_candidates(selected_election, street_address)
      results = Civic_Info_Api.get_candidate_info(selected_election, street_address)
      candidate_array = results.collect do |result|
        self.new(result[:name], result[:party], result[:age], result[:gender])
      end
      binding.pry
    end
  end

  def self.display_candidates
    self.load_candidates
    candidate_array = self.all
    puts "Loading Candidates...".colorize(:light_cyan)
    sleep 3
    candidate_array.each.with_index(1) do |candidate, index|
        puts "#{index}. #{candidate.display_name}".colorize(:cyan)
    end
  end
  
end