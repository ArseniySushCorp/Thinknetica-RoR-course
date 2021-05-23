class Carriage
  include Creator
  attr_reader :type, :number

  def initialize(number, _count_value, type)
    @type = type
    @number = number
  end
end
