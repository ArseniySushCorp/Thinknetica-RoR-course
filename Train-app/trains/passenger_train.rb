class PassengerTrain < Train
  include Validation

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, /^[a-z1-9]{3}-*[a-z1-9]{2}$/

  def initialize(number, type = :passenger)
    super

    validate!
  end
end
