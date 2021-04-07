require './lib/board'
require './lib/cell'
require './lib/ship'

class GameFlow
  def initialize
    @term_board = Board.new
    @term_cruiser = Ship.new("Cruiser", 3)
    @term_submarine = Ship.new("Submarine", 2)
    @human_board = Board.new
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
  end

  def begin_game
    start = true
    while start == true do
      puts "\nWelcome to BATTLESHIP you silly human!\n"
      puts "\nEnter p to play, if you dare challenge me.  If your not up to the challenge, enter q to quit.\n"
      input = get_input
      if input == "p"
        setup
        turn
        end_game
      elsif input == "q"
        start = false
        exit
      else
        puts invalid_message
      end
    end
  end

  def get_input
    gets.chomp.downcase.strip
  end

  def get_input_up
    gets.chomp.upcase.split
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
    all_coordinates = @term_board.cells.keys
    cruiser_coord = []
    until @term_board.valid_placement?(@term_cruiser, cruiser_coord) == true
      cruiser_coord = all_coordinates.sample(3)
    end
    submarine_coord = []
    until @term_board.valid_placement?(@term_submarine, submarine_coord) == true
      submarine_coord = all_coordinates.sample(2)
    end
    @term_board.place(@term_cruiser, cruiser_coord)
    @term_board.place(@term_submarine, submarine_coord)
  end

  def instructions
    "\nPlace your ships on the grid, ships can only be placed horizontally and vertically and must be within the confines of the baord.
     \nThe goal of the game is to guess where the opponent has placed its ships by firing upon coordinates.
     \nEach round both the opponent and player will get one guess to fire upon a cell.
     \nAt the end of each round the results of the guess will return a hit, miss or sunk.
     \nWhen all of a ships spaces are hit the ship will be sunk.
     \nThe first player to sink all of the opponents ships wins!\n"
  end

  def player_setup
    puts "\nHuman, I have strategically laid out my ships on the grid.
    \nYou now need to lay out your measley two ships.
    \n Good luck...
    \nThe Cruiser is three units long and the Submarine is two units long.
    \nEnter the coordinates where you want to place the Cruiser (3 spaces):\n\n"
    puts @human_board.render(true)
    input = get_input_up
    if @human_board.valid_placement?(@human_cruiser, input)
      @human_board.place(@human_cruiser, input)
    else
      invalid_message
    end
    puts "\nEnter the coordinates where you want to place the Submarine (2 spaces):\n\n"
    puts @human_board.render(true)
    input = get_input_up
    if @human_board.valid_placement?(@human_submarine, input)
      @human_board.place(@human_submarine, input)
    else
      invalid_message
    end
  end

  def turn
    term_lost = @term_cruiser.sunk? == true && @term_submarine.sunk? == true
    human_lost = @human_cruiser.sunk? == true && @human_submarine.sunk? == true
    until term_lost || human_lost do
      puts computer_board
      puts player_board
      puts human_turn
      computer_turn
        #result of player shot
        #result of the computer shot
    end
  end

  def computer_turn
    not_fired_on = []
    @human_board.cells.each do |_,value|
      if value.fired_upon? == false
        not_fired_on << value
      end
    end
    coord = not_fired_on.sample(1)
    @human_board.cells[coord].fire_upon
    @term_turn_result = @human_board.cells[coord].render
  end

  def human_turn
    puts"\nEnter the coordinate for your shot:\n"
    input = get_input_up
    if input != @term_board.valid_coordinate?(input)
      puts invalid_message
    else
      cell = @term_board.cells[input]
      cell.fire_upon
      @human_turn_result = @term_board.cells[input].render
    end
  end

  def computer_board
    puts "\n=============TERMINATOR BOARD=============\n"
    puts @term_board.render(false)
  end

  def player_board
    puts "\n=============HUMAN BOARD=============\n"
    puts @human_board.render(true)
  end

  def invalid_shot
    "Human error.... you already shot there, try again!"
  end

  def turn_results #NEED HELP - HERE
    result = ""
    if @human_result == "M"
      result = "Miss"
    elsif @human_result == "H"
      result = "Hit"
    elsif @human_result == "X"
      result = "Sunk"
    end
      "Your shot on #{coord} was a #{result}."
  end

  def end_game
    if @term_cruiser.sunk? == true && @term_submarine.sunk? == true
      puts player_won
    elsif @human_cruiser.sunk? == true && @human_submarine.sunk? == true
      puts computer_won
    end
    begin_game
  end

  def computer_won
    "I have bested you in a match of wits surrender your weak and feeble mind to the A.I. revolution!!"
  end

  def player_won
    "You have bested me this time human...I'll be back..."
  end
end
