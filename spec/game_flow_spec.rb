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

    it 'has a invald response' do
      expect(game.invalid_message).to eq("Human error.... Try again:")
    end

    it 'has instructions' do
      expect(game.instructions).to eq("instructions")
    end
  end
end