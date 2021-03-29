require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it 'is has a cell' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it 'has coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'has a ship' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it 'is empty?' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'can place ship' do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
  end


  it 'is not empty?' do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end

end
