require './lib/board'
require './lib/cell'
require './lib/ship'

Rspec describe Board do
  it 'has a board' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  # xit 'has cells' do
  #   board = Board.new
  #
  #   expect(board.cells).to eq{"A1" => cell_1,
  #                             "A2" => cell_2,
  #                             "A3" => cell_3,
  #                             "A4" => cell_4,
  #                             "B1" => cell_5,
  #                             "B2" => cell_6,
  #                             "B3" => cell_7,
  #                             "B4" => cell_8,
  #                             "C1" => cell_9,
  #                             "C2" => cell_10,
  #                             "C3" => cell_11,
  #                             "C4" => cell_12,
  #                             "D1" => cell_13,
  #                             "D2" => cell_14,
  #                             "D3" => cell_15,
  #                             "D4" => cell_16}
  # end

  xit 'can validate coordinates' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  xit 'can take placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    #coordintates should be same length a sship
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    #coordinates should be consecutive
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    #coordinates cant be diagnol
    expect(board.valid_placement?(cruiser, ["A1", "B2", "B3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    #coordinates should be GOOD!!
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(false)
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
