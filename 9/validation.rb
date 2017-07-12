module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations
    def validate(method, type, *args)
      @validations ||= []
      @validations << { method: method, type: type, args: args }
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue
      false
    end

    protected

    def validate!
      raise "Нет аргументов для проверки в класе: #{self.class}" if self.class.validations.nil?
      self.class.validations.each do |validation|
        validation[:attr_value] = instance_variable_get("@#{validation[:method]}")
        send validation[:type], validation
      end
      true
    end

    def presence(options)
      error_msg1 = "Атрибут #{options[:method]} в классе #{self.class}"
      error_msg2 = 'не может быть nil или пустой строкой'
      raise "#{error_msg1} #{error_msg2}" if options[:attr_value].to_s.empty?
    end

    def format(options)
      error_msg = "Ошибка! Не правильный формат атрибута #{options[:method]} в классе #{self.class}"
      raise error_msg if options[:attr_value] !~ options[:args].first
    end

    def type(options)
      error_msg = "Аргумент #{options[:method]} должен быть класса #{options[:args].first}"
      raise error_msg unless options[:attr_value].is_a?(options[:args].first)
    end
  end
end
