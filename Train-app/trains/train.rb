class Train
  attr_reader :number, :type, :speed, :carriages, :station, :route, :hash

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
    @hash = { number => @type }
    @speed = 0

    puts "New train №#{@number}, type #{@type}"
  end

  def speed_up
    @speed += 20
    puts "Train speed is #{@speed} km/h"
  end

  def brake
    if speed_zero?
      puts 'The train is already standing'
    else
      puts 'The train stopped'
      @speed = 0
    end
  end

  def add_carriage(carriage)
    if speed_zero? && valid_carriage?(carriage)
      @carriages << carriage.hash
      puts "The carriage type: #{carriage.type} with number: #{carriage.number} has been added"
    else
      puts 'ERROR: The train is moving or carriage not valid, cannot be added'
    end
  end

  def delete_carriage
    if speed_zero? && !@carriages.empty?
      @carriages.pop
      puts 'The carriage has been deleted'
    else 
      puts 'ERROR: The train is moving or there is no carriage in it, the carriage cannot be deleted'
    end
  end

  def take_route(value)
    @route = define_route(value)
    @station = @route.first
    puts "The train has a route, it's ready to go from #{@station} station!"
  end

  def move(station)
    if @route.include?(station) && !speed_zero?
      @station = station
      puts "Now train is on #{@station} station"
    else
      puts 'There is no such station on the route, or seed equal zero'
    end
  end

  def near_stations
    unless @route
      return puts 'No route'
    end

    show_near_stations
  end

  private

  def station_index
    @route.index(@station)
  end

  def speed_zero?
    @speed.zero?
  end

  def show_near_stations
    if @station == @route.first
      puts "Near stations is #{@station}, #{@route[station_index + 1]}"
    elsif @station == @route.last
      puts "Near stations is #{@route[station_index - 1]}, #{@station}"
    else
      puts "Near stations is #{@route[station_index - 1]}, #{@station}, #{@route[station_index + 1]}"
    end
  end

  def instance_of_route?(value)
    value.instance_of? Route
  end

  def define_route(value)
    instance_of_route?(value) ? value.stations : value
  end
end
