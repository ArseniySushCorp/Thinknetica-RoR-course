class Carriage
  include Creator
  attr_reader :type, :number

  def initialize(number, type)
    @type = type
    @number = number
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise 'Max value for carriage number is 10 symbols' if number.to_s.length > 10

    true
  end
end
