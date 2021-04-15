class PassengerCarriage < Carriage
  def initialize(number, type = :passenger)
    @number = number
    super
  end
end
