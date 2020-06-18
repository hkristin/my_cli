class Votesmart_Api
  @@base_url = "http://api.votesmart.org/Election"
  
  def self.get_election_data(zipcode) 
    
    response = RestClient.get(@@base_url + ".getElectionByZip?zip5=#{zipcode}")
    #binding.pry
  end
end