class Train
  include Creator
  include InstanceCounter
  attr_reader :number, :type, :speed, :carriage, :route

  TRAIN_NUMBER_REG_EXP = /^[a-z1-9]{3}-*[a-z1-9]{2}$/

  @@all = []

  def self.all
    @@all
  end

  def self.find(number)
    @@all.find { |train| train.number == number }
  end

  def initialize(number, type)
    register_instance
    @number = number
    @type = type
    @carriages = []
    @speed = 0
    validate!
    @@all << self
  end

  def speed_up
    @speed += 20
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    raise 'Carriage not valid or train moving' unless speed_zero? && @type.eql?(carriage.type)

    @carriages << carriage
  end

  def delete_carriage
    raise 'Train moving or train wthout carriages' unless speed_zero? && !@carriages.empty?

    @carriages.pop
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

  def each_car(&block)
    @carriages.each { |car| block.call(car) }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise 'Train number not valid' if number !~ TRAIN_NUMBER_REG_EXP
    raise 'Train with this number already exist' if self.class.find(number)
  end

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
