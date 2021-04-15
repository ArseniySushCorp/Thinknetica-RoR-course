class CargoCarriage < Carriage
  def initialize(number, type = :cargo)
    @number = number
    super
  end
end
