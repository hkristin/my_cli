class My_CLI
  
  def call
    puts "Welcome, today is a day for change!"
    puts "(Type 'exit' at anytime to leave)"
    
    puts "Please enter a valid street address (1263 Pacific Ave. Kansas City, KS) to see upcoming elections in your local area:"
    
    street_address = gets.strip
    
    if street_address == "exit" 
      exit 
    end
      
    Election.load_elections(street_address)
    
    puts "These are the elections in your local area:"
    
    Election.display_elections(street_address)
    
    puts "Select a number for an election you would like to learn more about:"
    
    selected_election = gets.strip.to_i
    
    if selected_election == "exit"
      exit 
    end
    
    Candidate.load_candidates(selected_election, street_address)
    
    puts "Here is the list of candidates for the selected election:"
    
    
    Candidate.display_candidates(selected_election, street_address)
    
    puts "What would you like to do next?"
    puts "1. Look up elections with a different adddress."
    puts "2. Exit"
    
    choice = gets.strip
    
    case choice
    when "1"
      puts "One second!"
      call
    when "2"
      exit 
    else 
      puts "Invalid Input. Please try again!"
    end
    # puts "Enter your zipcode to see the upcoming elections in your area: (user enters a valid zipcode)" <-- 
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