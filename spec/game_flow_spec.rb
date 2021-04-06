require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game_flow'

RSpec.describe GameFlow do
  context 'exists' do
    game = GameFlow.new

    xit 'is a game' do
      expect(game).to be_instance_of(GameFlow)
    end

    xit 'has a invald response' do
      expect(game.invalid_message).to eq("Human error.... Try again:")
    end

    xit 'has instructions' do
      expect(game.instructions).to eq("")
    end

    xit 'has computer setup' do
    expect(game.computer_setup).to eq('')
    end

    it 'has rhing do' do
    expect(game.computer_turn).to eq[]
    end
  end
end
