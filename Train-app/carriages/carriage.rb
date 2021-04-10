class Carriage
  attr_reader :hash, :type, :number

  def initialize(number, type)
    @type = type
    @number = number
    @hash = { @number => @type }

    puts "New Carriage: #{@type} number:#{@number}"
  end
end
