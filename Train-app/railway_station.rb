class RailwayStation
  attr_accessor :name

  def initialize(name)
    @name = name
    @trains = {}
    puts "Station #{@name} created"
  end

  def take_train(train)
    
  end
end
