class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def first
    @stations.first
  end

  def last
    @stations.last
  end

  def intermediate
    @stations[1..-2]
  end

  def add(station)
    @stations.insert(-2, station)
  end

  def delete(station)
    @stations.delete(station)
  end
end
