class Train
  attr_reader :number, :type, :speed, :carriage, :route

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
    @speed = 0
  end

  def speed_up
    @speed += 20
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    if speed_zero? && valid_carriage?(carriage)
      @carriages << carriage
    else
      puts 'ERROR: The train is moving or carriage not valid, cannot be added'
    end
  end

  def delete_carriage
    if speed_zero? && !@carriages.empty?
      @carriages.pop
    else
      puts 'ERROR: The train is moving or there is no carriage in it, the carriage cannot be deleted'
    end
  end

  def station
    @station = @route.find_train(self)
  end

  def next_station
    return if station_last?

    @route.stations[station_index + 1]
  end

  def prev_station
    return if station_first?

    @route.stations[station_index - 1]
  end

  def take_route(route)
    @route = route
    @route.stations.first.take_train(self)
  end

  def move_forward
    return if station_last?

    next_station.take_train(self)
    @station.send_train(self)
  end

  def move_backward
    return if station_first?

    prev_station.take_train(self)
    @station.send_train(self)
  end

  private

  def station_index
    @route.stations.index(station)
  end

  def speed_zero?
    @speed.zero?
  end

  def carriage_not_zero?
    !@carriage.zero?
  end

  def station_last?
    station == @route.last
  end

  def station_first?
    station == @route.first
  end
end
