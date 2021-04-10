class CargoTrain < Train
  def initialize(number, type = :cargo)
    super
  end

  private

  def can_add_carriage?(carriage)
    carriage.instance_of? CargoCarriage
  end
end
