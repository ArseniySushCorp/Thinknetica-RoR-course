class RailwayStation
  include InstanceCounter
  attr_reader :trains, :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    register_instance
    @name = name
    @trains = []
    validate!
    @@all << self
  end

  def trains_by(type)
    @trains.select { |train| train.type == type }.size
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train) unless @trains.empty?
  end

  def each_train(&block)
    @trains.each { |train| block.call(train) }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise 'Name must be string' if name.class != String
    raise 'Name must contains at least 5 symbols' if name.length < 5
  end
end
