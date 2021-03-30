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

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fire_upon
    @fire = true
  end

  def fired_upon?
    if @fire == true
      true
    else
      false
    end
  end

  def render
    if fired_upon? == false
      "."
    elsif empty? == true && fired_upon? == true
      "M"
    elsif empty? == false && fired_upon? == true
      "H"
    elsif fired_upon? == true && @ship.sunk == true
      "X"
    end
  end
end
