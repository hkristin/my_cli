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

  def self.load_elections
  
  end

  def self.display_elections
    
  end
end