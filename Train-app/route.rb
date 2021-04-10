class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = instance_of_station?(first) && instance_of_station?(last) ? [first.name, last.name] : [first, last]

    puts "Route created from #{@stations.first} to #{@stations.last}"
  end

  def first
    puts "First station is #{@stations.first}"
  end

  def last
    puts "Last station is #{@stations.last}"
  end

  def intermediate
    puts "Intermediate stations is #{@stations[1..-2]}"
  end

  def add(value)
    station = define_station(value)
    insert(station)

    puts "New station: #{station} added to route"
  end

  def delete(value)
    station = define_station(value)

    if @stations.include?(station)
      @stations.delete(station)

      puts "Station #{station} deleted"
    else
      puts "No such station: #{station} in the route"
    end
  end

  def show_all
    @stations.each { |station| puts station }
  end

  private

  def instance_of_station?(value)
    value.instance_of? RailwayStation
  end

  def insert(station)
    @stations.insert(-2, station)
  end

  def define_station(value)
    instance_of_station?(value) ? value.name : value
  end
end
