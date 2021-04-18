module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :amount_instances

    def instances
      @count_instances
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.amount_instances ||= 0
      self.class.amount_instances += 1
    end
  end

end