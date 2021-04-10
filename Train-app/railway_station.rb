class RailwayStation
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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
