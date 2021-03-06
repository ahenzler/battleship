require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  context 'exists' do
    board = Board.new

    it 'is a board' do
      expect(board).to be_instance_of(Board)
    end

    it 'has cells' do
      expect(board.cells.keys.count).to eq(16)
      expect(board.cells.values.count).to eq(16)
    end

    it 'has valid coordinates' do
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end

  context 'has valid placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    it 'has coordinates with same length as ship' do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'has consecutive coordinates' do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'has no diagonal coordinates' do
      expect(board.valid_placement?(cruiser, ["A1", "B2", "B3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'has good coordinates' do
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    end
  end

  context 'valid placement helpers' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    it 'has a valid length' do
      expect(board.length_valid?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.length_valid?(submarine, ["A2", "A3"])).to eq(true)
    end

    it 'has rows/colls' do
      expect(board.rows_consecutive?).to eq(true)
      expect(board.colls_consecutive?).to eq(true)
    end

    it 'is diagonal' do
      expect(board.diagonal?).to eq(true)
      expect(board.diagonal?).to eq(true)
    end
  end

  context 'placing ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    it 'can place ships' do
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)

      expect(cell_3.ship) == cell_2.ship
    end
  end

  context 'placing ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    it 'can place ships' do
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end

    it 'does not have overlapping ships' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end
  end

  context 'render board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    it 'can render board' do
      board.place(cruiser, ["A1", "A2", "A3"])
      expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      expect(board.render).to eq(expected)

      expected = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
      expect(board.render(true)).to eq(expected)
    end
  end
end