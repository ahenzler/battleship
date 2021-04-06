class GameFlow
  attr_reader :terminator_start,
              :human_start
  def initialize
    @terminator_start = ''
    @human_start = ''
  end

  def begin_game
    start = true
    while start == true do
      puts "\nWelcome to BATTLESHIP you silly human!\n"
      puts "\nEnter p to play, if you dare challenge me.  If your not up to the challenge, enter q to quit.\n"
      input = get_input
      if input == "p"
        setup
        # turn
        # end_game
      elsif input == "q"
        start = false
        exit
      else
        puts invalid_message
      end
    end
  end


  def get_input
    input = gets.chomp
    input.downcase.strip.delete(' ')
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
    crusiser_coord = []
    until term_board.valid_placement?(term_cruiser, crusiser_coord) == true
      crusiser_coord = all_coordinates.sample(3)
    end
    submarine_coord = []
    until term_board.valid_placement?(term_submarine, submarine_coord) == true
      submarine_coord = all_coordinates.sample(2)
    end
    term_board.place(term_cruiser, crusiser_coord)
    term_board.place(term_submarine, submarine_coord)
    @terminator_start = term_board.render(reveal = false)
  end

  def instructions
    "\nPlace your ships on the grid, ships can only be placed horizontally and vertically and must be within the confines of the baord.
     \nThe goal of the game is to guess where the opponent has placed its ships by firing upon the cell coordinates.
     \nEach round both the opponent and player will get one guess to fire upon a cell.
     \nAt the end of each round the results of the guess will return a Hit or Miss.
     \nWhen all of a ships spaces are hit the ship will be sunk.
     \nThe first player to sink all of the opponents ships wins!\n"
  end

  def player_setup
    human_board = Board.new
    human_cruiser = Ship.new("Cruiser", 3)
    human_submarine = Ship.new("Submarine", 2)

    puts "\nHuman, I have strategically laid out my ships on the grid.
    \nYou now need to lay out your measley two ships.\n Good luck...
    \nThe Cruiser is three units long and the Submarine is two units long.
    \nEnter the squares for the Cruiser (3 spaces):\n"
    puts human_board.render(reveal = true)
    get_input
    input = get_input.upcase

    if input != human_board.valid_placement?
      invalid_message
    else
      human_board.place_ship(input)
    end
    puts "\nEnter the squares for the Submarine (2 spaces):\n"
    puts human_board.render(reveal = true)
    get_input
    input = get_input.upcase

    if input != human_board.valid_placement?
      invalid_message
    else
      human_board.place_ship(input)
    end
    @human_start = human_board.render(reveal = true)
  end

  def turn
    puts computer_board
    puts player_board

    puts human_turn
    computer_turn

        # - computer
    #computer takes a shot - random- valid coordinate? - add shot to player board
    # - shot report
    # - to get cell that was shot on status
    #result of player shot
    #result of the computer shot
  end

  def human_turn
    puts"\nEnter the coordinate for your shot:\n"
    get_input
    input = get_input.upcase
    if input != @terminator_start.valid_coordinate?(input)
      invalid_message
    else
      @terminator_start.cells[input].fire_upon
      @terminator_result = @terminator_start.cells[input].render
    end
  end

  def computer_turn
    not_fired_on = []

    @human_start.cells.each do |_,value|
      if value.fired_upon? == false
        not_fired_on << value
      end
    end
    coord = not_fired_on.sample(1)
    @human_start.cells[coord].fire_upon
    @human_result = @human_start.cells[coord].render
  end

  def computer_board
    "\n=============TERMINATOR BOARD=============\n#{@terminator_start.render(reveal = false)}"
  end

  def player_board
    "\n=============HUMAN BOARD=============\n#{@human_start.render(reveal = true)}"
  end

  def invalid_shot
    "Human error.... you already shot there, better luck next time!"
  end

  def turn_results
    result = ""
    if @human_result = "M"
      result = "Miss"
    elsif @human_result = "H"
      result = "Hit"
    elsif @human_result = "X"
      result = "Sunk"
    end
      "Your shot on #{coord} was a #{result}."

    # retunr reult of human board
    # print string result with interp


    human
    # input of user on computer board
    #print string result with interp
  end

  def end_game
    # begin_game
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
