# -*- coding: utf-8 -*-
module Ground
  
  class Ridge < Activity

    data_reader :path, :verb

    class << self

      attr_reader :routes

      # 路由节点的结构 [path, activity]
      def route(verb, path, activity)
        
        if @routes.nil?
          @routes = {'GET' => [], 'POST' => []}
        end

        @routes[verb] << [path, activity]
        
      end

    end

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call(&p)
      activity = Class.new(Activity)
      route(activity)
      activity.class_eval &p if block_given?
      activity
    end

    private

    def route(activity)
      self.class.route(verb, path, activity)
    end

  end

end
