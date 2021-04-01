class Board
  attr_reader :cells

  def initialize
    @cells = {}
    add_cells
  end

  def add_cells
    ["A", "B", "C", "D"].each do |letter|
      ["1", "2", "3", "4"].each do |number|
        name = letter + number
        @cells[name] = name
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
    if ship.length == coordinates.length
      true
    else
      false
    end
  end

  # def length_valid?(ship, coordinates)
  #   if ship.length == coordinates.length
  #     true
  #   else
  #     false
  #   end
  # end

  # def consecutive?(ship, coordinates)
  # end

  # def no_diagonal?(ship, coordinates)
  # end
end
