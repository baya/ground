module Ground
  
  class Ridge < Activity

    data_reader :path, :verb

    class << self

      attr_reader :routes

      def route(location, activity)
        @routes ||= {}
        @routes[location] = activity
      end

    end
    
    def call(&p)
      activity = Class.new(Activity)
      route(activity)
      activity.class_eval &p if block_given?
      activity
    end

    private

    def route(activity)
      self.class.route(location, activity)
    end

    def location
      "%s:@:%s" % [verb.upcase, path]
    end
    
  end

end
