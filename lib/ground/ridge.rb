# -*- coding: utf-8 -*-
module Ground
  
  class Ridge < Activity

    data_reader :path, :verb, :state

    class << self

      attr_reader :routes

      # 路由节点的结构 [path, state]
      def route(verb, path, state)
        
        if @routes.nil?
          @routes = {'GET' => [], 'POST' => []}
        end

        @routes[verb] << [path, state]
        
      end

    end

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call
      route(state)
    end

    private

    def route(state)
      self.class.route(verb, path, state)
    end

  end

end
