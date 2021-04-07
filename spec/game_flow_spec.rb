require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game_flow'

RSpec.describe GameFlow do
  context 'exists' do
    game = GameFlow.new

    it 'is a game' do
      expect(game).to be_instance_of(GameFlow)
    end
  end

  context 'exists with' do
    term_board = Board.new
    term_cruiser = Ship.new("Cruiser", 3)
    term_submarine = Ship.new("Submarine", 2)
    term_shot = ''
    human_board = Board.new
    human_cruiser = Ship.new("Cruiser", 3)
    human_submarine = Ship.new("Submarine", 2)
    human_shot = ''
    game = GameFlow.new

    it 'has terminator pieces' do

      expect(term_board).to be_instance_of(Board)
      expect(term_cruiser).to be_instance_of(Ship)
      expect(term_submarine).to be_instance_of(Ship)
      expect(term_shot).to eq('')
    end

    it 'has human pieces' do

      expect(human_board).to be_instance_of(Board)
      expect(human_cruiser).to be_instance_of(Ship)
      expect(human_submarine).to be_instance_of(Ship)
      expect(human_shot).to eq('')
    end
  end
end
