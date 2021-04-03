require './lib/ship'

RSpec.describe Ship do
  context 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    it 'is a ship' do
      expect(cruiser).to be_instance_of(Ship)
    end

    it 'has a name' do
      expect(cruiser.name).to eq("Cruiser")
    end

    it 'has a length' do
      expect(cruiser.length).to eq(3)
    end

    it 'has health' do
      expect(cruiser.health).to eq(3)
    end
  end

  context 'ship status' do
    cruiser = Ship.new("Cruiser", 3)

    it 'is not sunk?' do
      expect(cruiser.sunk?).to eq(false)
    end

    it 'has a hit' do
      cruiser.hit
      expect(cruiser.health).to eq(2)
    end

      it 'is sunk?' do
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
    end
  end
end