class RoutesActions < Menu
  attr_reader :data

  def start
    system('clear')
    return no_match('routes') if @data.nil? || @data[:routes].empty?

    @selected_route = choose_route

    routes_actions
  end

  def routes_actions
    catch(:exit) do
      loop do
        system('clear')
        puts '------ROUTE ACTIONS------'
        route_actions_list
        command = user_input
        throw :exit if command == 'b'

        case command
        when '1'
          switch(add_station)
        when '2'
          switch(delete_station)
        else
          switch(wrong)
        end
      end
    end
  end

  def add_station
    system('clear')
    @selected_station = choose_station

    @selected_route.add(@selected_station)
    puts "Station #{@selected_station.name} added to route"
    no_commands
  end

  def delete_station
    system('clear')
    @selected_station = choose_route_stations

    @selected_route.delete(@selected_station)
    puts "Station #{@selected_station.name} deleted from route"

    no_commands
  end

  def choose_route_stations
    puts 'Choose route station:'
    @selected_route.intermediate.each { |station| puts "#{@data[:stations].index(station)} - #{station.inspect}" }
    station_index = user_input.to_i

    @data[:stations][station_index]
  end

  def choose_station
    puts 'Choose station:'
    @data[:stations].each do |station|
      unless @selected_route.stations.include?(station)
        puts "#{@data[:stations].index(station)} - #{station.inspect}"
      end
    end

    station_index = user_input.to_i

    @data[:stations][station_index]
  end

  def route_actions_list
    puts '1 - add station'
    puts '2 - delete station'
    puts 'b - for back'
  end
end