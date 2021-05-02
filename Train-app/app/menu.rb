class Menu < Main
  def initialize(data = { trains: [], stations: [], routes: [], carriages: [] })
    @data = data
    super
  end

  def start
    catch(:exit) do
      loop do
        system('clear')
        display
        puts '------MAIN MENU------'
        menu_actions_list
        menu_command = user_input
        throw :exit if menu_command == 'q'
        case menu_command
        when '1'
          switch_menu(create_menu)
        when '2'
          switch_menu(trains_actions)
        when '3'
          switch_menu(routes_actions)
        when '4'
          switch_menu(cars_actions)
        else
          switch(wrong)
        end
      end
    end
  end

  protected

  def data
    { trains: @trains, stations: @stations, routes: @routes, carriages: @carriages }
  end

  def choose_train
    puts 'Choose train:'
    @data[:trains].each { |train| puts "#{@data[:trains].index(train)} - #{train.inspect}" }
    train_index = user_input.to_i

    @data[:trains][train_index]
  end

  def choose_station
    puts 'Choose station:'
    @data[:stations].each { |station| puts "#{@data[:stations].index(station)} - #{station.inspect}" }
    station_index = user_input.to_i

    @data[:stations][station_index]
  end

  def choose_route
    puts 'Choose route:'
    @data[:routes].each { |route| puts "#{@data[:routes].index(route)} - #{route.inspect}" }
    route_index = user_input.to_i

    @data[:routes][route_index]
  end

  def choose_carriage
    puts 'Choose carriage:'
    @data[:carriages].each { |carriage| puts "#{@data[:carriages].index(carriage)} - #{carriage.inspect}" }
    carriage_index = user_input.to_i
    @data[:carriages][carriage_index]
  end

  private

  def create_menu
    CreateMenu.new(@data)
  end

  def trains_actions
    TrainsActions.new(@data)
  end

  def routes_actions
    RoutesActions.new(@data)
  end

  def cars_actions
    CarriagesActions.new(@data)
  end

  def display
    @data.each { |arr| arr.each { |value| puts value.inspect } }
  end

  def switch_menu(action)
    @data = action.data
    action
  end

  def menu_actions_list
    puts '1 - create train, carriage, station, route'
    puts '2 - trains actions'
    puts '3 - routes actions'
    puts '4 - carriage actions'
  end
end
