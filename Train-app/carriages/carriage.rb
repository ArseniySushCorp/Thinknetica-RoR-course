class Carriage
  include Creator
  attr_reader :type, :number

  def initialize(number, type)
    @type = type
    @number = number
  end
end
