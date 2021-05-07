class CargoCarriage < Carriage
  include Validation
  attr_reader :volume

  validate :number, :presence
  validate :max_volume, :presence
  validate :max_volume, :type, Integer, 'Max volume must be number'

  def initialize(number, max_volume, type = :cargo)
    @max_volume = max_volume
    @volume = 0
    super

    validate!
  end

  def fill_volume(value)
    @volume += value
  end

  def free_volume
    @max_volume - @volume
  end
end
