class Train
  attr_reader :number, :type, :speed, :carriage, :route

  def initialize(number, type, carriage)
    @number = number
    @type = type
    @carriage = carriage
    @station_index = 0
    @speed = 0
  end

  def speed_up
    @speed += 20
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriage += 1 if speed_zero?
  end

  def delete_carriage
    @carriage -= 1 if speed_zero? && carriage_not_zero?
  end

  def station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1] unless station_last?
  end

  def prev_station
    @route.stations[@station_index - 1] unless station_first?
  end

  def take_route(route)
    @route = route
  end

  def move_forward
    @station_index += 1 unless station_last?
  end

  def move_backward
    @station_index -= 1 unless station_first?
  end

  private

  def speed_zero?
    @speed.zero?
  end

  def carriage_not_zero?
    !@carriage.zero?
  end

  def station_last?
    station == @route.stations.last
  end

  def station_first?
    station == @route.stations.first
  end
end
