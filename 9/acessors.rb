module Acessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*methods)
      methods.each do |method|
        raise TypeError, 'Имя метода не символ' unless method.is_a?(Symbol)
        define_method(method) { instance_variable_get("@#{method}") }
        define_method("#{method}=") do |value|
          instance_variable_set("@#{method}", value)
          @history ||= {}
          @history[method] ||= []
          @history[method] << value
        end
        define_method("#{method}_history") { @history[method] }
      end
    end

    def strong_attr_acessor(method, value_type)
      raise TypeError, 'Имя метода не символ' unless method.is_a?(Symbol)
      define_method(method) { instance_variable_get("@#{method}") }
      define_method("#{method}=") do |value|
        raise TypeError, "#{method} не #{value_type}" unless value.class.to_s.eql?(value_type)
        instance_variable_set("@#{method}", value)
      end
    end
  end
end
