class PassengerTrain < Train
  def initialize(number, type = :passenger)
    super
  end

  private

  def can_add_carriage?(carriage)
    carriage.instance_of? PassengerCarriage
  end
end
