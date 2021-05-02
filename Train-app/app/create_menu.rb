class CreateMenu < Menu
  attr_reader :data

  def start
    exit_loop('------CREATE MENU------', create_actions_list) do |command|
      case command
      when '1'
        switch(create_train_menu)
      when '2'
        switch(create_carriage_menu)
      when '3'
        switch(create_station_menu)
      when '4'
        switch(create_route_menu)
      else
        switch(wrong)
      end
    end
  end

  private

  def create_train_menu
    exit_loop('------CREATE TRAIN------', create_actions('train')) do |command|
      case command
      when '1'
        switch(create_train(CargoTrain))
      when '2'
        switch(create_train(PassengerTrain))
      else
        switch(wrong)
      end
    end
  end

  def create_carriage_menu
    exit_loop('------CREATE CARRIAGE------', create_actions('carriage')) do |command|
      case command
      when '1'
        switch(create_cargo)
      when '2'
        switch(create_passenger)
      else
        switch(wrong)
      end
    end
  end

  def create_train(train)
    system('clear')
    puts "------CREATE #{train}------"
    puts 'Enter train number:'

    begin
      train_number = user_input
      @data[:trains] << train.new(train_number)
    rescue RuntimeError => e
      puts e.inspect
      retry
    end

    puts "Train #{@data[:trains].last.inspect} created"
    exit
  end

  def create_cargo
    system('clear')
    puts '------CREATE CARGO CARRIAGE------'

    create_car(CargoCarriage) { 'Enter max volume for cargo carriage' }

    puts "Carriage #{@data[:carriages].last.inspect} created"
    exit
  end

  def create_passenger
    system('clear')
    puts '------CREATE PASSENGER CARRIAGE------'

    create_car(PassengerCarriage) { 'Enter max seats for passenger carriage' }

    puts "Carriage #{@data[:carriages].last.inspect} created"
    exit
  end

  def create_car(carriage)
    puts 'Enter carriage number:'
    car_number = user_input.to_i

    puts yield
    car_count_value = user_input.to_i

    @data[:carriages] << carriage.new(car_number, car_count_value)
  rescue RuntimeError => e
    puts e.inspect
    retry
  end

  def create_station_menu
    system('clear')
    puts '------CREATE STATION------'
    puts 'Enter station name:'
    begin
      station_name = user_input
      @data[:stations] << RailwayStation.new(station_name)
    rescue RuntimeError => e
      puts e.inspect
      retry
    end

    puts "Station #{@data[:stations].last.inspect} created"
    exit
  end

  def create_route_menu
    first_station = choose_stations('first')
    last_station = choose_stations('last')
    begin
      @data[:routes] << Route.new(first_station, last_station)
    rescue RuntimeError => e
      puts e.inspect
      retry
    end

    puts "Route #{@data[:routes].last.inspect} created"
    exit
  end

  def choose_stations(order)
    system('clear')
    puts '------CREATE ROUTE------'
    puts "Choose #{order} stations for route:"

    choose_station
  end

  def create_actions(value)
    [
      "1 - Cargo #{value}",
      "2 - Passenger #{value}",
      'b - for back'
    ]
  end

  def create_actions_list
    [
      '1 - create new train',
      '2 - create new carriage',
      '3 - create new station',
      '4 - create new route',
      'b - for back'
    ]
  end
end
