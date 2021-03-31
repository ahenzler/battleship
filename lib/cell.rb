class Cell
  attr_reader :coordinate,
              :ship,
              :fire

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fire = true
    else
      @fire = true
    end
  end

  def fired_upon?
    if @fire == true
      true
    else
      false
    end
  end

  def render(ship = nil)
    if empty? == true && fired_upon? == true
      "M"
    elsif fired_upon? == true && @ship.sunk? == true
      "X"
    elsif empty? == false && fired_upon? == true
      "H"
    elsif ship == true && fired_upon? == false
      "S"
    elsif fired_upon? == false
      "."
    end
  end
end
