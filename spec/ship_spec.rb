require './lib/ship'

RSpec.describe Ship do
  it 'is a ship' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'is not sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it 'has a hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

    it 'is sunk?' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end

end