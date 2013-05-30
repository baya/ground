# -*- coding: utf-8 -*-
module Ground
  
  class Ridge < Activity

    data_reader :path, :verb

    class << self

      attr_reader :routes

      # 路由节点的结构 [path, resource]
      def route(verb, path, resource)
        
        if @routes.nil?
          @routes = {'GET' => [], 'POST' => []}
        end

        @routes[verb] << [path, resource]
        
      end

    end

    def initialize(data)
      super
      @verb = verb.upcase
    end

    def call(&p)
      resource = Class.new(Resource)
      route(resource)
      resource.class_eval &p if block_given?
      resource
    end

    private

    def route(resource)
      self.class.route(verb, path, resource)
    end

  end

end
