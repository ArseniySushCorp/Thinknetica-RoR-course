class CarriagesActions < Menu
  attr_reader :data

  def start
    system('clear')
    return no_match('carriage') if @data.nil? || @data[:carriages].empty?

    @selected_car = choose_carriage

    cars_actions
  end

  private

  def cars_actions
    catch(:exit) do
      loop do
        system('clear')
        puts '------CARRIAGE ACTIONS------'
        car_actions_list
        command = user_input
        throw :exit if command == 'b'

        case command
        when '1'
          switch(action)
        else
          switch(wrong)
        end
      end
    end
  end

  def fill_volume
    system('clear')
    puts 'Enter volume that you wont to add:'
    volume = user_input.to_i
    @selected_car.fill_volume(volume)

    puts "Volume increased by #{volume}"
    puts @selected_car.inspect

    exit
  end

  def action
    @selected_car.is_a?(CargoCarriage) ? fill_volume : take_seat
  end

  def take_seat
    system('clear')
    @selected_car.take_seat

    puts 'Seats number increased'
    puts @selected_car.inspect

    exit
  end

  def car_actions_list
    puts '1 - take seats or fill volume'
    puts 'b - for back'
  end
end
