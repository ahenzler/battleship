require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  context 'exists' do
    cell = Cell.new("B4")
    it 'is has a cell' do
      expect(cell).to be_instance_of(Cell)
    end

    it 'has coordinate' do
      expect(cell.coordinate).to eq("B4")
    end

    it 'has a ship' do
      expect(cell.ship).to eq(nil)
    end

    it 'is empty?' do
      expect(cell.empty?).to eq(true)
    end
  end

  context 'ship placement' do
    it 'can place ship' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("B4")
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end
  end

  context 'ship status' do
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
  end

  context 'has a render' do
    it 'can render' do
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)

      expect(cell_1.render).to eq(".")

      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
      expect(cell_2.render).to eq(".")

      cell_2.fire_upon

      expect(cell_2.render).to eq("H")
      expect(cruiser.sunk?).to eq(false)

      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end
end
