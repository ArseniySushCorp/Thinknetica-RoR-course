class PassengerCarriage < Carriage
  include Validation
  attr_reader :seats

  validate :number, :presence
  validate :max_seats, :presence
  validate :max_seats, :type, Integer, 'Max seats must be number'

  def initialize(number, max_seats, type = :passenger)
    @max_seats = max_seats
    @seats = 0
    super

    validate!
  end

  def take_seat
    @seats += 1
  end

  def free_seats
    @max_seats - @seats
  end
end
