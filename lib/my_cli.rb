class My_CLI
  
  def call
    puts "Welcome, today is a day for change!"
    
    Votesmart_Api.get_election_data(15217)
    # puts "Enter zipcode to search for upcoming elections in your area: (user enters a valid zipcode)" <-- 
    # This should be handled in a way that, if the user enters an invalid zipcode, a message is put out and 
    # may try again. (puts "Invalid zipcode. Please try again!")
    
    # You would have some kind of method defined in Election that takes the zipcode and collaborates with the 
    # VotesmartAPI class to retreive the appropriate election data (based on that zipcode). 
    
    # Iterate over some kind of election array and numerically displays the name (so the user can pick a 
    # number to choose an election). 
    
    # The user chooses an election, and some kind of method from the Candidate class is called that may pass
    # in the election object. It returns an array of candidates running in that election, from which the user
    # can choose to learn more about. 
    
    # The user chooses a candidate, and a separate Candidate method collaborates with the VotesmartAPI class to retreive that candidate's information. 
  end
  
end