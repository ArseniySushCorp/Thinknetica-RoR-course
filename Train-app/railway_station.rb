class RailwayStation
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = {}
    puts "Station #{@name} created"
  end

  def trains_list
    @trains.values
  end

  def trains_list_by_type
    {FREIGHT => count_trains_by_type(FREIGHT), PASSENGER => count_trains_by_type(PASSENGER)}
  end

  def take_train(train)
    @trains[train.number] = train.type
  end

  def send_train(train)
    @trains.key?(train.number) && @trains.delete(train.number)
  end

  private

  def count_trains_by_type(type)
    trains_by_type = @trains.select { |_, v| v == type }
    trains_by_type.size
  end
end
