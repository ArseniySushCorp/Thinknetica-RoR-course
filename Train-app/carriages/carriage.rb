class Carriage
  include Creator
  attr_reader :type, :number

  def initialize(number, type)
    @type = type
    @number = number

    puts "New Carriage: #{@type} number:#{@number}"
  end
end
