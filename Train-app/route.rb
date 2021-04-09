class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first.name, last.name]

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

  def add(station)
    @stations.insert(-2, station)
    puts "New station (#{station}) added to route"
  end

  def delete(station)
    if @stations.include?(station.name)
      @stations.delete(station.name)

      puts "Station #{station.name} deleted"
    else
      puts "No such station: #{station} in the route"
    end
  end
end