class PassengerCarriage < Carriage
  attr_reader :seats

  def initialize(number, max_seats, type = :passenger)
    @max_seats = max_seats
    @seats = 0
    validate!
    super
  end

  def take_seat
    @seats += 1
  end

  def free_seats
    @max_seats - @seats
  end

  private

  def validate!
    raise 'Max seats must be number' unless @max_seats.is_a? Integer
  end
end
