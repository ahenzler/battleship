class Board
  attr_reader :cells

  def initialize
    @cells = {}
    @collumns_range = ("1..4")
    @rows_range = ("A..D")
    add_cells
  end

  def add_cells
    ["A", "B", "C", "D"].each do |letter|
      ["1", "2", "3", "4"].each do |number|
        name = letter + number
        @cells[name] = Cell.new(name)
      end
    end
  end

  def valid_coordinate?(coordinate)
    if @cells.key?(coordinate)
      true
    else
      false
    end
  end

  # def valid_coordinates?(coordinates)
    # if @rows_range.include?(coordinates[0]) && @collumns_range.include?(coordinates[1])
    #         true
    #   else
    #     false
    #   end
  # end

  #dont nest conditionals - predicate methods
  # helper methods
  # every branch - method has to be tested
  # make sure you test every case
  #make rows and colloms


  def valid_placement?(ship, coordinates)
    if length_valid?(ship, coordinates)
    end
  end

  def length_valid?(ship, coordinates)
    ship.length == coordinates.length
  end

  def consecutive?(coordinates)
    #colls are numbers
    #rows are letters
    colls = []
    rows = []
    coordinates.each_char do |char|
      rows << char[0].ord
      colls << char[1].to_i
    end
    rows.each_cons(2).all? do |a,b|
      a - b == -1
    end
    colls.each_cons(2).all? do |a,b|
      a - b == -1
    end
      #you can use include? on each consecutive
      #at the end see if all the index's of the result are the same
      #we need it to return a true or false
    end
  end

  # diagonal?(ship, coordinates)
  # end




end
