class RoutesActions < Menu
  attr_reader :data

  def start
    system('clear')
    return no_match('routes') if @data.nil? || @data[:routes].empty?

    @selected_route = choose_route

    routes_actions
  end

  private

  def routes_actions
    exit_loop('------ROUTE ACTIONS------', route_actions_list) do |command|
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

  def add_station
    system('clear')
    @selected_station = choose_station

    @selected_route.add(@selected_station)
    puts "Station #{@selected_station.name} added to route"

    exit
  end

  def delete_station
    system('clear')
    @selected_station = choose_route_stations

    @selected_route.delete(@selected_station)
    puts "Station #{@selected_station.name} deleted from route"

    exit
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
    [
      '1 - add station',
      '2 - delete station',
      'b - for back'
    ]
  end
end