module Accessor
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = class_var(name)
      var_name_assign = class_var_assign(name)

      define_method(name) { instance_variable_get(var_name) }

      define_method(var_name_assign) do |value|
        instance_variable_set(HISTORY_NAME, {}) unless instance_variable_defined?(HISTORY_NAME)

        history = instance_variable_get(HISTORY_NAME)
        history[name] ||= []
        history[name] << value

        instance_variable_set(var_name, value)
      end

      define_method("#{name}_history") do
        history = instance_variable_get(HISTORY_NAME)

        return [] if history.nil? || history[name].nil?

        history[name]
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = class_var(name)
    var_name_assign = class_var_assign(name)

    define_method(name) { instance_variable_get(var_name) }

    define_method(var_name_assign) do |value|
      instance_variable_set(var_name, value)

      raise "Expected #{type}" unless value.instance_of?(type)
    end
  end

  private

  HISTORY_NAME = '@history'.freeze

  def class_var(value)
    "@#{value}".to_sym
  end

  def class_var_assign(value)
    "#{value}=".to_sym
  end
end
