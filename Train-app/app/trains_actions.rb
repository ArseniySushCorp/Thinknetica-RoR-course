class TrainsActions < Menu
  attr_reader :data

  def start
    system('clear')
    return no_match('trains') if @data.nil? || @data[:trains].empty?

    @selected_train = choose_train

    train_actions
  end

  def train_actions
    catch(:exit) do
      loop do
        system('clear')
        puts '------TRAIN ACTIONS------'
        train_actions_list
        menu_command = user_input
        throw :exit if menu_command == 'q'

        case menu_command
        when '1'
          switch(carriage_action('add'))
        when '2'
          switch(carriage_action('delete'))
        when '3'
          switch(train_move(:forward))
        when '4'
          switch(train_move(:backward))
        when '5'
          switch(train_take_route)
        else
          switch(wrong)
        end
      end
    end
  end

  def train_take_route
    system('clear')
    return no_match('route') if @data[:routes].empty?

    @selected_route = choose_route
    @selected_train.take_route(@selected_route)
  end

  def carriage_action(action)
    system('clear')
    return no_match('carriage') if @data[:carriages].empty?

    if action == 'add'
      @selected_carriage = choose_carriage

      @selected_train.add_carriage(@selected_carriage)
      puts "#{@selected_carriage} added to #{@selected_train}"
    else
      @selected_train.delete_carriage
      puts "Last carriage deleted from #{@selected_train}"
    end
    no_commands
  end

  def train_move(duration)
    system('clear')
    return no_match('route') if @data[:routes].empty?

    if duration == :forward
      @selected_train.move_forward
    else
      @selected_train.move_backward
    end
  end

  def trains_actions_list
    puts '1 - move forward'
    puts '2 - move backward'
    puts '3 - take route'
    puts 'q - for quit'
  end

  def train_actions_list
    puts '1 - add carriage'
    puts '2 - delete carriage'
    puts '3 - move forward'
    puts '4 - move backward'
    puts '5 - take route'
    puts 'q - for quit'
  end
end