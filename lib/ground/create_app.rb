# -*- coding: utf-8 -*-
module Ground


  class CreateApp < Activity
    data_reader :name

    def call
      Class.new do
        def call(env)
          req = Rack::Request.new(env)
          location = Ground::ComputeLocation(verb: req.request_method,
                                             path: req.path_info)

          activity = location[1]

          raise "#{req.path_info}访问路径不存在" if activity == 0
          
          activity << {env: env}
        end
      end
    end
    
  end

end
