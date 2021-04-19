class CreateMenu < Menu
  attr_reader :data

  def start
    catch(:exit) do
      loop do
        system('clear')
        puts '------CREATE MENU------'
        create_actions_list
        command = user_input
        throw :exit if command == 'b'
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
  end

  private

  def create_train_menu
    catch(:exit) do
      loop do
        system('clear')
        puts '------CREATE TRAIN------'
        create_actions('train')
        command = user_input
        throw :exit if command == 'b'
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
  end

  def create_carriage_menu
    catch(:exit) do
      loop do
        system('clear')
        puts '------CREATE CARRIAGE------'
        create_actions('carriage')
        command = user_input
        throw :exit if command == 'b'
        case command
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
    train_number = user_input.to_i
    @data[:trains] << train.new(train_number)

    system('clear')
    puts "Train #{@data[:trains].last.inspect} created"
    no_commands
  end

  def create_carriage(carriage)
    system('clear')
    puts "------CREATE #{carriage}------"
    puts 'Enther carriage number:'
    carriage_number = user_input.to_i
    @data[:carriages] << carriage.new(carriage_number)

    system('clear')
    puts "Carriage #{@data[:carriages].last.inspect} created"
    no_commands
  end

  def create_station_menu
    system('clear')
    puts '------CREATE STATION------'
    puts 'Enther station name:'
    begin
      station_name = user_input
      @data[:stations] << RailwayStation.new(station_name)
    rescue
      puts 'Name not valid'
      retry
    end

    system('clear')
    puts "Station #{@data[:stations].last.inspect} created"
    no_commands
  end

  def create_route_menu
    first_station = choose_stations('first')
    last_station = choose_stations('last')
    @data[:routes] << Route.new(first_station, last_station)

    system('clear')
    puts "Route #{@data[:routes].last.inspect} created"
    no_commands
  end

  def choose_stations(order)
    system('clear')
    puts '------CREATE ROUTE------'
    puts "Choose #{order} stations for route:"

    choose_station
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