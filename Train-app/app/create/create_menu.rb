class CreateMenu < Menu
  attr_reader :data

  def start
    exit_loop('------CREATE MENU------', create_actions_list) do |command|
      case command
      when '1'
        switch_menu(create_train)
      when '2'
        switch_menu(create_car)
      when '3'
        switch_menu(create_station)
      when '4'
        switch_menu(create_route)
      else
        switch(wrong)
      end
    end
  end

  private

  def create_train
    CreateTrain.new(@data)
  end

  def create_car
    CreateCarriage.new(@data)
  end

  def create_station
    CreateStation.new(@data)
  end

  def create_route
    CreateRoute.new(@data)
  end

  def create_actions(value)
    [
      "1 - Cargo #{value}",
      "2 - Passenger #{value}",
      'b - for back'
    ]
  end

  def create_actions_list
    [
      '1 - create new train',
      '2 - create new carriage',
      '3 - create new station',
      '4 - create new route',
      'b - for back'
    ]
  end
end
