module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(type, *args)
      validates = '@validates'
      instance_variable_set(validates, {}) unless instance_variable_defined?(validates)
      instance_variable_get(validates)[type] = *args
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get('@validates').each do |type, args|
        method = "validate_#{args.first}"
        value = instance_variable_get("@#{type}")

        send(method, value, *args[1, args.length])
      end
      true
    end

    def valid?
      validate!
    rescue ArgumentError
      false
    end

    private

    def validate_presence(value, message = "Can't be empty")
      raise ArgumentError, message if var.nil? || value.is_a?(String) && value.empty?
    end

    def validate_format(value, format, message = 'Invalid format')
      raise ArgumentError, message unless value =~ format
    end

    def validate_type(value, expected_class, message = "#{expected_class} expected")
      raise ArgumentError, message unless value.instance_of? expected_class
    end
  end
end
