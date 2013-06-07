module Ground
  class Validate < Activity

    attr_reader :errors, :validations

    def initialize(data)
      super
      @errors = {}
      @validations = []
    end

    def call
      execute_validations
    end
    
    private

    def validates(attr, error_msg, &p)
      validation = validations.detect {|validation|
        validation[0] == attr and validation[1] == error_msg
      } || [attr, error_msg, p]
      validations << validation
    end

    def execute_validations
      validations.each {|validation|
        attr, error_msg, p = validation
        if !p.call
          errors[attr] ||= []
          errors[attr] << error_msg if !errors[attr].include?(error_msg)
        end
      }
      errors
    end

  end
end
