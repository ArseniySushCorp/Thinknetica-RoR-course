class CreateCarriage < CreateMenu
  def start
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

  private

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

    raise ArgumentError, 'Number expected' if car_number.zero? || car_count_value.zero?

    @data[:carriages] << carriage.new(car_number, car_count_value)
  rescue ArgumentError => e
    puts e.inspect
    retry
  end
end
