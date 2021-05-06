class Carriage
  include Creator
  attr_reader :type, :number

  def initialize(number, type, _count_value = 0)
    @type = type
    @number = number
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise 'Max value for carriage number is 10 symbols' if number.to_s.length > 10
  end
end
