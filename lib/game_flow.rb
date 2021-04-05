class GameFlow
  attr_reader
  def initialize
  end

  def game_flow
    # main_menu
    # setup
    # turn
    # end_game
  end

  def get_input
    gets.chomp.downcase.strip
  end

  def main_menu
    print "\nWelcome to BATTLESHIP\nEnter p to play. Enter q to quit.\n"
    if get_input == "p"
      #method to do somehting
    elsif get_input == "q"
      exit
    else
      puts "Invald Respone"
    end
  end

  def setup
    #HELPER METHODS
    # - computer
    #generate a computer board with ships - using valid placement
    # - instructions
    #display instructions/sample
    # - player
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
    # - helper helper to get cell that was shot on status
    #result of player shot
    #result of the computer shot
  end

  def turn_results #helper helper
    #HELPER METHODS -
    #shot miss - shot hit - shot sunk
  end

  def end_game
    #HELPER METHODS
    #  - determins if both of a player/computer ships have sunk
    # if so
    #print who wins
    #return to main menu
  end

end