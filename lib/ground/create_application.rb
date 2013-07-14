# -*- coding: utf-8 -*-
module Ground

  class CreateApplication < Activity
    data_reader :name

    def initialize(data)
      super
      @middlewares = []
    end

    def call(&p)
      app = Class.new
      app.send :include, Ground::Protocol::Log
      app.send(:define_method, :call) do |env|
        began_at = Time.now
        req = Rack::Request.new(env)
        location = Ground::Locate(verb: req.request_method, path: req.path_info)
        route, state = location
        response = state << {env: env, route: route}

        log began_at, req, state, response
        
        response
      end

      instance_eval &p
      app_with_middlewares = pack_middlewares_to_app app

    end

    private

    def use(middleware, *args, &p)
      @middlewares << lambda {|app| middleware.new(app, *args, &p)}
    end

    def pack_middlewares_to_app(app)
      app_with_middlewares = app.new
      @middlewares.reverse.each {|middleware|
        app_with_middlewares = middleware.call(app_with_middlewares)
      }
      app_with_middlewares
    end
    
  end

end
