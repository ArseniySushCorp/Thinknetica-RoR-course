class CargoCarriage < Carriage
  attr_reader :volume

  def initialize(number, max_volume, type = :cargo)
    @number = number
    @max_volume = max_volume
    @volume = 0
    super
  end

  def fill_volume(value)
    @volume += value
  end

  def free_volume
    @max_volume - @volume
  end
end
