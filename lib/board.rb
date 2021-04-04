class Board
  attr_reader :cells

  def initialize
    @cells = {}
    @rows_only = []
    @colls_only = []
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


  def valid_placement?(ship, coordinates)
    if length_valid?(ship, coordinates) && overlap?(coordinates)
      create_rows_colls(coordinates)
      if rows_consecutive? && colls_consecutive?
        true
        !diagonal?
      else
        false
      end
    else
      false
    end
  end

  def overlap?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def length_valid?(ship, coordinates)
    ship.length == coordinates.length
  end

  def create_rows_colls(coordinates)
    @rows_only = coordinates.map do |coord|
      coord.chars.first.ord
    end
    @colls_only = coordinates.map do |coord|
      coord.chars.last.to_i
    end
  end

  def rows_consecutive?
    @rows_only.each_cons(2).all? {|a,b| a - b == -1} || @rows_only.each_cons(2).all? {|a,b| a == b}
  end

  def colls_consecutive?
     @colls_only.each_cons(2).all? {|a,b| a - b == -1} || @colls_only.each_cons(2).all? {|a,b| a == b}
  end

  def diagonal?
    @rows_only.each_cons(2).all? {|a,b| a - b == -1} && @colls_only.each_cons(2).all? {|a,b| a - b == -1}
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      (@cells[coordinate]).place_ship(ship)
    end
  end

  def render(reveal = false)
    grid = ''
    @cells.keys.each do |key|
      grid += " " + @cells[key].render(reveal)
    end
    grid.insert(0,"  1 2 3 4 \nA")
    grid.insert(-24, "\nB ")
    grid.insert(-16, "\nC ")
    grid.insert(-8, "\nD ")
    grid.insert(-1, " \n")
    return grid
  end
end
