class Menu < Main
  def start
    catch(:exit) do
      loop do
        system('clear')
        puts '------MAIN MENU------'
        menu_actions_list
        menu_command = user_input
        throw :exit if menu_command == 'q'
        case menu_command
        when '1'
          switch(create_menu.start)
        when '2'
          switch(trains_actions)
        when '3'
          switch(routes_actions)
        else
          switch(wrong)
        end
      end
    end
  end

  def create_menu
    CreateMenu.new
  end

  def menu_actions_list
    puts '1 - create train, carriage, station, route'
    puts '2 - trains actions'
    puts '3 - routes actions'
    puts 'q - for quit'
  end
end