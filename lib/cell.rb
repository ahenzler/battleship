class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
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

  def fired_upon?
    if @ship.health < @ship.length
      true
    else
      false
    end
  end

  def fire_upon
    if empty? == false
      @ship.hit
    end
  end
 #meeting at 12:25 mst
  # def render
  #   if empty? == true
  #     "."
  #   elsif fired_upon? == true && empty? == true
  #     "M"
  #   elsif fired_upon? == true && empty? == false
  #     "H"
  #   elsif empty? == false
  #     "S"
  #   end
  # end
end
