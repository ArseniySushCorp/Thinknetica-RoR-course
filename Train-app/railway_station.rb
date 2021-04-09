class RailwayStation
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = {}
    puts "Station #{@name} created"
  end

  def trains_list
    puts "Now on station #{@trains.length} trains"
  end

  def trains_list_by_type
    puts "Freight: #{count_trains_by_type(@trains, FREIGHT)}"
    puts "Passenger: #{count_trains_by_type(@trains, PASSENGER)}"
  end

  def take_train(train)
    get_train_params(train)

    if @number.empty? || @type.empty?
      puts 'Invalid train :('
    else
      @trains[@number] = @type
      puts "Train #{@number} and type #{@type} received at the station"
    end
  end

  def send_train(train)
    get_train_params(train)
    
    if @trains.key?(@number)
      @trains.delete(@number)
      puts "The train with number: #{@number} leave station #{@name}"
    else
      puts 'There is no such train at the station'
    end
  end

  private

  def get_train_params(train)
    @number = train.keys.join
    @type = train.values.join
  end

  def count_trains_by_type(trains, type)
    count = 0

    trains.each_value do |train_type|
      train_type == type and count += 1
    end

    count
  end
end
