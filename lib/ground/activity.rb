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
    
    def self.<<(data = {})
      new(data).call
    end

    def self.data_reader *attrs
      attrs.each do |attr|
        define_method(attr) { data[attr]}
      end
    end

    def self.data_default attr, default
      define_method(attr) { data[attr] || default}
    end

    def self.set name, value
      define_method(name) { value }
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
