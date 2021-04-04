class Message
  def welcome
    "\nWelcome to BATTLESHIP human player!\n Enter p to play. Enter q to quit.\n"
  end

  def instructions
    "Instructions"
  end

  def placement
    return "\nHuman, I have strategically laid out my ships on the grid.\n"
    return "\nYou now need to lay out your measley two ships.\nGood luck..."
    return "\nThe Cruiser is three units long and the Submarine is two units long.\n"
    return "board.render"
    return "\nEnter the squares for the Cruiser (3 spaces):\n"
  end

  def second_placement
    return "board.render"
    return "\nEnter the squares for the Submarine (2 spaces):\n"
  end

  def invalid_message
    "Cant you read? Try again:"
  end

  def computer_board
    "\n=============COMPUTER BOARD=============\nboard.render"
  end

  def player_board
    "\n=============HUMAN BOARD=============\nboard.render"
  end

  def player_shot
    "Enter the coordinate for your shot, Good luck:"
  end

  def invalid_shot
    "Uhhhh?... maybe try again human:"
  end

  def result
    "\nYour shot on (input) was a (result).\nMy shot on (input) was a (result).\n"
  end

  def computer_won
    "I have bested you in a match of wits surrender your weak and feeble mind to the A.I. revolution!!"
  end

  def player_won
    "You have bested me this time human...I'll be back..."
  end


end
