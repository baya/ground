# -*- coding: utf-8 -*-
module Ground

  class CreateApp < Activity
    data_reader :name, :config

    def initialize(data)
      super
      @middlewares = []
    end

    def call(&p)
      _config = config
      app = Class.new
      app.send(:define_method, :call) do |env|
        req = Rack::Request.new(env)
        location = Ground::Locate(verb: req.request_method, path: req.path_info)
        route, resource = location
        
        resource << {env: env, route: route, config: _config}
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
