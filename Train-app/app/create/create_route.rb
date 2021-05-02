class CreateRoute < CreateMenu
  def start
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

  private

  def choose_stations(order)
    system('clear')
    puts '------CREATE ROUTE------'
    puts "Choose #{order} stations for route:"

    choose_station
  end
end
