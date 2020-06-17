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
  
end