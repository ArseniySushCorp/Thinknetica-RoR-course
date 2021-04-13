class CreateMenu < Menu
  def initialize
    super
  end

  def start
    catch(:exit) do
      loop do
        system('clear')
        puts '------CREATE MENU------'
        create_actions_list
        entered_command = user_input
        throw :exit if entered_command == 'b'
        case entered_command
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
  end

  def create_train_menu
    catch(:exit) do
      loop do
        system('clear')
        puts '------CREATE TRAIN------'
        create_actions('train')
        entered_command = user_input
        throw :exit if entered_command == 'b'
        case entered_command
        when '1'
          switch(create_train(CargoTrain))
        when '2'
          switch(create_train(PassengerTrain))
        else
          switch(wrong)
        end
      end
    end
  end

  def create_carriage_menu
    catch(:exit) do
      loop do
        system('clear')
        puts '------CREATE CARRIAGE------'
        create_actions('carriage')
        entered_command = user_input
        throw :exit if entered_command == 'b'
        case entered_command
        when '1'
          switch(create_carriage(CargoCarriage))
        when '2'
          switch(create_carriage(PassengerCarriage))
        else
          switch(wrong)
        end
      end
    end
  end

  def create_train(train)
    system('clear')
    puts "------CREATE #{train}------"
    puts 'Enther train number:'
    train_number = user_input
    @trains << train.new(train_number)

    system('clear')
    puts "Train #{@trains.last.inspect} created"
    no_commands
  end

  def create_carriage(carriage)
    system('clear')
    puts "------CREATE #{carriage}------"
    puts 'Enther carriage number:'
    carriage_number = user_input
    @carriages << carriage.new(carriage_number)

    system('clear')
    puts "Carriage #{@carriages.last.inspect} created"
    no_commands
  end

  def create_station_menu
    system('clear')
    puts '------CREATE STATION------'
    puts 'Enther station name:'
    station_name = user_input
    @stations << RailwayStation.new(station_name)

    system('clear')
    puts "Station #{@stations.last.inspect} created"
    no_commands
  end

  def create_route_menu
    first_station = choose_stations('first')
    last_station = choose_stations('last')
    @routes << Route.new(first_station, last_station)

    system('clear')
    puts "Route #{@routes.last.inspect} created"
    no_commands
  end

  def choose_stations(order)
    system('clear')
    puts '------CREATE ROUTE------'
    puts "Choose #{order} stations for route:"
    @stations.each { |station| puts "#{@stations.index(station)} - #{station.inspect}" }
    station_index = user_input

    @stations[station_index.to_i]
  end

  def no_commands
    puts 'Press any key for continue'
    user_input
  end

  def create_actions(value)
    puts "1 - Cargo #{value}"
    puts "2 - Passenger #{value}"
    puts 'b - for back'
  end


  def create_actions_list
    puts '1 - create new train'
    puts '2 - create new carriage'
    puts '3 - create new station'
    puts '4 - create new route'
    puts 'b - for back'
  end
end