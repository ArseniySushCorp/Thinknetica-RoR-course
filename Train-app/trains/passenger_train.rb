class PassengerTrain < Train
  def initialize(number, type = :passenger)
    super
  end

  private

  def valid_carriage?(carriage)
    carriage.instance_of? PassengerCarriage
  end
end
