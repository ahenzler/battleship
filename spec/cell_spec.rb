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

  it 'has a fired upon' do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  it 'has been fired upon' do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to eq(true)
  end

  it 'can render' do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")

    cell_1.fire_upon

    expect(cell_1.render).to eq("M")
  end

  xit 'can render' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(true)
  end

end
