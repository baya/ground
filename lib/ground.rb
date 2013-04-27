module Ground
  class Activity
    attr_reader :data

    def self.inherited(subclass)
      return if Kernel.method_defined? subclass.name
      
      Kernel.class_eval %Q{
        def #{subclass.name}(data = {})
          #{subclass.name}.new(data).call
        end
      }
      
    end
    
    def self.<< data
      new(data).call
    end

    def self.data_reader *attrs
      
      attrs.each do |attr|
        define_method attr do
          instance_variable_get("@#{attr}") || \
          instance_variable_set("@#{attr}", data[attr.to_sym])
        end
      end
      
    end

    def self.default attr, default
      orig_attr = "#{attr}_without_default"
      alias_method orig_attr, attr
      define_method attr do
        send(orig_attr) || default
      end
    end

    def self.set name, value

      if value.is_a? Symbol
        define_method name do
          instance_variable_get("@#{name}") || \
          instance_variable_set("@#{name}", send(value) )
        end
      elsif value.respond_to? :call
        define_method name do
          instance_variable_get("@#{name}") || \
          instance_variable_set("@#{name}", value.call)
        end
      else
        define_method name do
          instance_variable_get("@#{name}") || \
          instance_variable_set("@#{name}", value)
        end
      end
      
    end

    def initialize(data)
      @data = data
    end
    
    def call
      ''
    end

    private

    def get_or_set(name)
      value = instance_variable_get("@#{name}")
      return value if value
      value = yield
      instance_variable_set("@#{name}", value)
    end

  end

end
