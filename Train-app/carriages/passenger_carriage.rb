class PassengerCarriage < Carriage
  attr_reader :seats

  def initialize(number, max_seats, type = :passenger)
    super
    @max_seats = max_seats
    @seats = 0
  end

  def take_seat
    @seats += 1
  end

  def free_seats
    @max_seats - @seats
  end
end
