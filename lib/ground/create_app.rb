# -*- coding: utf-8 -*-
module Ground

  class CreateApp < Activity
    data_reader :name

    def call
      Class.new do
        def call(env)
          req = Rack::Request.new(env)
          location = Ground::Locate(verb: req.request_method, path: req.path_info)

          raise "#{req.path_info}访问路径不存在" if location.nil?

          route, activity = location
          
          activity << {env: env, route: route}
        end
      end
    end
    
  end

end
