class CreateTrain < CreateMenu
  def start
    exit_loop('------CREATE TRAIN------', create_actions('train')) do |command|
      case command
      when '1'
        switch(create_train(CargoTrain))
      when '2'
        switch(create_train(PassengerTrain))
      else
        switch(wrong)
      end
    end
  end

  private

  def create_train(train)
    system('clear')
    puts "------CREATE #{train}------"
    puts 'Enter train number:'

    begin
      train_number = user_input
      @data[:trains] << train.new(train_number)
    rescue ArgumentError => e
      puts e.inspect
      retry
    end

    puts "Train #{@data[:trains].last.inspect} created"
    exit
  end
end
