require_relative '../railway_station'
require_relative '../route'

require_relative '../carriages/carriage'
require_relative '../carriages/cargo_carriage'
require_relative '../carriages/passenger_carriage'

require_relative '../trains/train'
require_relative '../trains/cargo_train'
require_relative '../trains/passenger_train'

class Main
  def initialize(data = {})
    @data = data
    start
  end

  def start
    menu.start
  end

  def menu
    Menu.new
  end

  def switch(action)
    action
  end

  def wrong
    system('clear')
    puts 'Invalid command, press any key for continue'
    user_input
  end

  def user_input
    gets.chomp
  end
end

require_relative './menu'
require_relative './create_menu'
require_relative './trains_actions'
require_relative './routes_actions'


Main.new
