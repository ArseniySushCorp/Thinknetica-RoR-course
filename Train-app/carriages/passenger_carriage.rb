class PassengerCarriage < Carriage
  attr_reader :free_seats

  def initialize(number, max_seats, type = :passenger)
    super
    @max_seats = max_seats
    @free_seats = @max_seats
  end

  def take_seat
    @free_seats -= 1
  end

  def seats
    @max_seats - @free_seats
  end
end
