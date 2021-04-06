class GameFlow
  attr_reader
  def initialize
  end

  def begin_game
    puts "\nWelcome to BATTLESHIP you silly human!\n"
    puts "\nEnter p to play, if you dare challenge me.  If your not up to the challenge, enter q to quit.\n"
    get_input
    # if get_input == "p"
    #   # setup
    #   # turn
    #   # end_game
    # elsif get_input == "q"
    #   exit
    # else
    #   puts invalid_message
    # end
  end


  def get_input
    gets.chomp.downcase.strip.delete(" ")
  end

  def invalid_message
    "Human error.... Try again:"
  end

  def setup
    computer_setup
    puts instructions
    player_setup
  end

  def computer_setup
    term_board = Board.new
    term_cruiser = Ship.new("Cruiser", 3)
    term_submarine = Ship.new("Submarine", 2)

    all_coordinates = term_board.cells.keys
    all_coordinates.slice(0..4)

    #access the hash of cells just the keys - and - go through them
    #with board.cells.keys
    #- to get 3 valid and random coordinates
    # - add to the cruiser coord
    crusiser_coord = []
    #this need to have 3
    submarine_cord = []
    #this needs to have 2

    # board.place(ship, coordinates)
  end

  def instructions
  end

  def first_placement
    puts "\nHuman, I have strategically laid out my ships on the grid.\n"
    puts "\nYou now need to lay out your measley two ships.\nGood luck..."
    puts "\nThe Cruiser is three units long and the Submarine is two units long.\n"
    puts "board.render"
    puts "\nEnter the squares for the Cruiser (3 spaces):\n"
  end

  def second_placement
    puts "board.render"
    puts "\nEnter the squares for the Submarine (2 spaces):\n"
  end

  def player_setup
        #have user place ships and make sure they are valid and displayed x2
    #invlid responces
  end

  def turn
    #HELPER METHODS
    # - display boards
    #displays both boards at start of each turn - player can see thier ships but not computers
    #- player
    #player takes a shot - get input - valid coordinate? - edge case: coordinate has already been fired on - add shot to computer board
    # - computer
    #computer takes a shot - random- valid coordinate? - add shot to player board
    # - shot report
    # - to get cell that was shot on status
    #result of player shot
    #result of the computer shot
  end

  def computer_board
    "\n=============TERMINATOR BOARD=============\nboard.render"
  end

  def player_board
    "\n=============HUMAN BOARD=============\nboard.render"
  end

  def invalid_shot
    "Human error.... you already shot there, better luck next time!"
  end

  def turn_results #helper helper
    #shot miss - shot hit - shot sunk
  end

  def result
    "\nYour shot on (input) was a (result).\nMy shot on (input) was a (result).\n"
  end

  def end_game
    #HELPER METHODS
    #  - determins if both of a player/computer ships have sunk
    # if so
    #print who wins
    #return to main menu
  end

  def computer_won
    "I have bested you in a match of wits surrender your weak and feeble mind to the A.I. revolution!!"
  end

  def player_won
    "You have bested me this time human...I'll be back..."
  end

end