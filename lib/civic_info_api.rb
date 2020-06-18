class Civic_Info_Api
  @@base_url = "https://www.googleapis.com/civicinfo/v2"
  
  @@api_key = "AIzaSyBWHWJ7VkM7Q7WP4zUBd4lHv-JQ6-YvoSE"
  
  def self.get_election_data(zipcode) 
    
    response = RestClient.get(@@base_url + ".getElectionByZip?zip5=#{zipcode}")
    #binding.pry
  end
end