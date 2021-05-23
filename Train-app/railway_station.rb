class RailwayStation
  extend Accessor
  include Validation
  include InstanceCounter
  attr_reader :trains, :name

  validate :name, :presence
  validate :name, :type, String
  validate :name, :length, 5

  attr_accessor_with_history :cashbox, :shop
  strong_attr_accessor(:station_desc, String)

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
end
