# -*- coding: utf-8 -*-
module Ground

  class CreateApp < Activity
    data_reader :name, :config

    def call
      _config = config
      app = Class.new
      app.send(:define_method, :call) do |env|
        req = Rack::Request.new(env)
        location = Ground::Locate(verb: req.request_method, path: req.path_info)
        route, resource = location
        
        resource << {env: env, route: route, config: _config}
      end

      app
      
    end
    
  end

end
