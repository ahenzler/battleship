require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  it 'is a board' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new

  # expected = {"A1" => "A1",
  #             "A2" => "A2",
  #             "A3" => "A3",
  #             "A4" => "A4",
  #             "B1" => "B1",
  #             "B2" => "B2",
  #             "B3" => "B3",
  #             "B4" => "B4",
  #             "C1" => "C1",
  #             "C2" => "C2",
  #             "C3" => "C3",
  #             "C4" => "C4",
  #             "D1" => "D1",
  #             "D2" => "D2",
  #             "D3" => "D3",
  #             "D4" => "D4"}
  #   expect(board.cells).to eq(expected)
    expect(board.cells.keys.count).to eq(16)
    expect(board.cells.values.count).to eq(16)
  end


  it 'has valid coordinates' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'has coordinates with same length as ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  xit 'has consecutive coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  xit 'has no diagonal coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "B2", "B3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  xit 'has good coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
  end

  xit 'can place ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.cells["A1"]).to eq(cell_1)
    expect(board.cells["A2"]).to eq(cell_2)
    expect(board.cells["A3"]).to eq(cell_3)

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)

    #expect(cell_3.ship) == cell_2.ship
  end
end
