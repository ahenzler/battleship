require './lib/board'
require './lib/cell'
require './lib/ship'

class GameFlow
  def initialize
    @term_board = Board.new
    @term_cruiser = Ship.new("Cruiser", 3)
    @term_submarine = Ship.new("Submarine", 2)
    @term_shot = ''
    @human_board = Board.new
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @human_shot = ''
  end

  def begin_game
    start = true
    while start == true
      puts "\n\n--------------------------------------------------Welcome to BATTLESHIP you silly human!--------------------------------------------------\n"
      puts "\nEnter p to play, if you dare challenge me.  If your not up to the challenge, enter q to quit.
      \n------------------------------------------------------------------------------------------------------------------------------------------------------\n"
      input = get_input
      if input == "p"
        setup
        turn
        end_game
        new_game
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
    "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nHuman error.... Try again!
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
  end

  def new_game
    @term_board = Board.new
    @term_cruiser = Ship.new("Cruiser", 3)
    @term_submarine = Ship.new("Submarine", 2)
    @term_shot = ''
    @human_board = Board.new
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @human_shot = ''
    begin_game
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
    @term_board.place(@term_cruiser, cruiser_coord)
    submarine_coord = []
    until @term_board.valid_placement?(@term_submarine, submarine_coord) == true
      submarine_coord = all_coordinates.sample(2)
    end
    @term_board.place(@term_submarine, submarine_coord)
  end

  def instructions
    "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nPlace your ships on the grid, ships can only be placed horizontally and vertically and must be within the confines of the baord.
    \nThe goal of the game is to guess where the opponent has placed its ships by firing upon coordinates.
    \nEach round both the opponent and player will get one guess to fire upon a cell.
    \nAt the end of each round the results of the guess will return a hit, miss or sunk.
    \nWhen all of a ships spaces are hit the ship will be sunk.
    \nThe first player to sink all of the opponents ships wins!
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
  end

  def player_setup
    puts "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nHuman, I have strategically laid out my ships on the grid.\nYou now need to lay out your measley two ships.\nGood luck...
    \n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nThe Cruiser is three units long and the Submarine is two units long.
    \n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nEnter the coordinates where you want to place the Cruiser (3 spaces):
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
    puts @human_board.render(true)
    cruiser_placed = false
    until cruiser_placed == true
      input = get_input_up
      if @human_board.valid_placement?(@human_cruiser, input)
        @human_board.place(@human_cruiser, input)
        cruiser_placed = true
      else
        puts invalid_message
      end
    end
    sub_placed = false
    until sub_placed == true
      puts "\n------------------------------------------------------------------------------------------------------------------------------------------------------
      \nEnter the coordinates where you want to place the Submarine (2 spaces):
      \n------------------------------------------------------------------------------------------------------------------------------------------------------\n"
      puts @human_board.render(true)
      input = get_input_up
      if @human_board.valid_placement?(@human_submarine, input)
        @human_board.place(@human_submarine, input)
        sub_placed = true
      else
        puts invalid_message
      end
    end
  end

  def turn
    term_lost = @term_cruiser.sunk? && @term_submarine.sunk?
    human_lost = @human_cruiser.sunk? && @human_submarine.sunk?
    until term_lost || human_lost
      puts terminator_board
      puts human_player_board
      human_turn
      computer_turn
      puts human_turn_result
      puts terminator_turn_result
      term_lost = @term_cruiser.sunk? && @term_submarine.sunk?
      human_lost = @human_cruiser.sunk? && @human_submarine.sunk?
    end
  end

  def computer_turn
    not_fired_on = []
    @human_board.cells.each do |key, value|
      if value.fired_upon? == false
        not_fired_on << key
      end
    end
    coord = not_fired_on.sample(1)
    @human_board.cells[coord[0]].fire_upon
    @term_shot = coord
    @term_turn_result = @human_board.cells[coord[0]].render
    new = " "
  end

  def human_turn
    puts"\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nEnter the coordinate for your shot:
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
    shot_taken = false
    until shot_taken == true
      input = get_input_up
      if @term_board.valid_coordinate?(input[0])
        @term_board.cells[input[0]].fire_upon
        @human_result = @term_board.cells[input[0]].render
        @human_shot = input
        shot_taken = true
      else
        puts invalid_shot
      end
    end
  end

  def terminator_board
    puts "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \n🦾-🦾-🦾-🦾-🦾-TERMINATOR BOARD-🦾-🦾-🦾-🦾-🦾\n"
    puts @term_board.render(true)
  end

  def human_player_board
    puts "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \n💪-💪-💪-💪-💪-HUMAN BOARD-💪-💪-💪-💪-💪\n"
    puts @human_board.render(true)
  end

  def invalid_shot
    "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nHuman error.... invalid shot, better luck next time!
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
  end

  def human_turn_result
    result = ""
    if @human_result == "M"
      result = "miss"
    elsif @human_result == "H"
      result = "hit"
    elsif @human_result == "X"
      result = "has sunk a ship"
    end
    "\n------------------------------------------------------------------------------------------------------------------------------------------------------
    \nYour shot on #{@human_shot[0]} was a #{result}."
  end

  def terminator_turn_result
    result = ""
    if @term_turn_result == "M"
      result = "miss"
    elsif @term_turn_result == "H"
      result = "hit"
    elsif @term_turn_result == "X"
      result = "has sunk a ship"
    end
    "My shot on #{@term_shot[0]} was a #{result}.
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
  end

  def end_game
    if @term_cruiser.sunk? == true && @term_submarine.sunk? == true
      puts player_won
    elsif @human_cruiser.sunk? == true && @human_submarine.sunk? == true
      puts computer_won
    end
  end

  def computer_won
    puts terminator_board
    puts "\n\n--------------------------------------------------------------------😱GAME OVER😱--------------------------------------------------------------------
    \nI have bested you in a match of wits surrender your weak and feeble mind to the A.I. revolution!!
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
  end

  def player_won
    puts human_player_board
    puts "\n\n--------------------------------------------------------------------🤗GAME OVER🤗--------------------------------------------------------------------
    \nYou have bested me this time human...I'll be back...
    \n------------------------------------------------------------------------------------------------------------------------------------------------------"
  end
end
