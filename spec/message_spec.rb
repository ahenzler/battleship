require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/message'

RSpec.describe Message do
  context 'exists' do
    message = Message.new
    it 'has attributes' do

      expect(message).to be_instance_of(Message)
    end
  end

  context 'messages' do
    message = Message.new
    it 'has welcome message' do

      expect(message.welcome).to eq("\nWelcome to BATTLESHIP human player!\n Enter p to play. Enter q to quit.\n")
    end
  end

  context 'instructions' do
    message = Message.new
    it 'has instructions' do

      expect(message.instructions).to eq("Instructions")
    end
  end

  context 'first placement' do
    message = Message.new
    it 'asks for ship placement' do
      expected = "\nHuman, I have strategically laid out my ships on the grid.\n"
      "\nYou now need to lay out your measley two ships.\nGood luck..."
      "\nThe Cruiser is three units long and the Submarine is two units long.\n"
      "board.render"
      "\nEnter the squares for the Cruiser (3 spaces):\n"

      expect(message.placement).to eq(expected)
    end
  end

  context 'second placememt' do
    message = Message.new
    it 'asks for second ship placement' do
      expected = "board.render"
      "\nEnter the squares for the Submarine (2 spaces):\n"

      expect(message.second_placement).to eq(expected)
    end
  end

  context 'invalid placement' do
    message = Message.new
    it 'returns invalid placememt message' do
      expected = "Cant you read? Try again:"

      expect(message.invalid_message).to eq(expected)
    end
  end

  context 'display boards' do
    message = Message.new
    it 'shows computer board' do
      expected = "\n=============COMPUTER BOARD=============\nboard.render"

      expect(message.computer_board).to eq(expected)
    end
  end

  context 'display boards' do
    message = Message.new
    it 'shows player board' do
      expected = "\n=============HUMAN BOARD=============\nboard.render"

      expect(message.player_board).to eq(expected)
    end
  end

  context 'player shot' do
    message = Message.new
    it 'asks for player shot' do
      expected = "Enter the coordinate for your shot, Good luck:"

      expect(message.player_shot).to eq(expected)
    end
  end

  context 'invalid shot' do
    message = Message.new
    it 'asks for valid coordinate' do
      expected = "Uhhhh?... maybe try again human:"

      expect(message.invalid_shot).to eq(expected)
    end
  end

  context 'result' do
    message = Message.new
    it 'returns turn result message' do
      expected = "\nYour shot on (input) was a (result).\nMy shot on (input) was a (result).\n"

      expect(message.result).to eq(expected)
    end
  end

  context 'computer won message' do
    message = Message.new
    it 'displays computer won message' do
      expected = "I have bested you in a match of wits surrender your weak and feeble mind to the A.I. revolution!!"

      expect(message.computer_won).to eq(expected)
    end
  end

  context 'player won message' do
    message = Message.new
    it 'displays player won message' do
      expected = "You have bested me this time human...I'll be back..."

      expect(message.player_won).to eq(expected)
    end
  end
end
