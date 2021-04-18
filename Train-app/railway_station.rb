class RailwayStation
  attr_reader :trains, :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
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
end
