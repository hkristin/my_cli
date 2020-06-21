class Civic_Info_Api
  @@base_url = "https://www.googleapis.com/civicinfo/v2"
  
  @@api_key = "AIzaSyBWHWJ7VkM7Q7WP4zUBd4lHv-JQ6-YvoSE"
 
  
  def self.get_election_data(street_address)
    path = "#{@@base_url}/voterinfo?key=#{@@api_key}&address=#{street_address.gsub(",", " ").gsub(" ", "%20")}&electionId=2000"
    response = RestClient.get(path)
    response_json = JSON.parse(response.body)
    #binding.pry
  end
  
  def self.get_candidate_info
    response = RestClient.get("#{self.base_url}names.json?api-key=#{self.api_key}")
    response = JSON.parse(response.body, symbolize_names:true)
    results = response[:results]
    results = results.slice(0, results.length-54)
    results
  end  
  
  def self.api_key
    @@api_key
  end

  def self.base_url
    @@base_url
  end
  
  end