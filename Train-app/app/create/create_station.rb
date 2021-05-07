class CreateStation < CreateMenu
  def start
    system('clear')
    puts '------CREATE STATION------'
    puts 'Enter station name:'
    begin
      station_name = user_input
      @data[:stations] << RailwayStation.new(station_name)
    rescue ArgumentError => e
      puts e.inspect
      retry
    end

    puts "Station #{@data[:stations].last.inspect} created"
    exit
  end
end
