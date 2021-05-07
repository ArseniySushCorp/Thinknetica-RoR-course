module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(var_name, *args)
      validates_name = '@validates'
      instance_variable_set(validates_name, {}) unless instance_variable_defined?(validates_name)
      instance_variable_get(validates_name)[var_name] ||= []
      instance_variable_get(validates_name)[var_name] << args
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get('@validates').each do |var_name, validators|
        validators.each do |validator|
          method = "validator_#{validator.first}"
          var_value = instance_variable_get("@#{var_name}")

          send(method, var_value, *validator[1, validator.size])
        end
      end
      true
    end

    def valid?
      validate!
    rescue ArgumentError
      false
    end

    private

    def validator_presence(value, message = "Can't be empty")
      raise ArgumentError, message if value.nil? || value.is_a?(String) && value.empty?
    end

    def validator_format(value, reg_exp, message = "Format not valid, #{reg_exp} expected")
      raise ArgumentError, message unless value =~ reg_exp
    end

    def validator_type(value, expected_class, message = "#{expected_class} expected")
      raise ArgumentError, message unless value.instance_of? expected_class
    end

    def validator_length(value, expected, message = "Expected length #{expected}")
      raise ArgumentError, message if value.is_a?(String) && value.length < expected
    end
  end
end
