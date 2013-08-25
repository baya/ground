# -*- coding: utf-8 -*-
module Ground
  
  class Ridge < Activity

    data_reader :path, :verb, :state

    class << self

      attr_reader :routes, :states

      # 路由节点的结构 [path, state]
      def route(verb, path, state)

        @routes ||= {'GET' => [], 'POST' => []}
        @states ||= []
        
        @routes[verb] << [path, state]
        @states << state if not @states.include?(state)
        
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
