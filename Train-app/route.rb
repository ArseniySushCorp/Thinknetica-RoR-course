class Route
  include Validation
  include InstanceCounter
  attr_reader :stations

  validate :first, :presence
  validate :first, :type, RailwayStation
  validate :last, :presence
  validate :last, :type, RailwayStation

  def initialize(first, last)
    @first = first
    @last = last
    register_instance

    validate!

    @stations = [@first, @last]
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

  def find_train(train)
    @stations.find { |station| station.trains.include?(train) }
  end
end
